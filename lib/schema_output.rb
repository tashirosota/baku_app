#
# rake dev:output_schema_defineで利用します
# tasks/output_htmlにてevalにoverrideしてあるスクリプトを,
# 文字列として入れて実行するモノのため直接の実行は禁止。
# rubocop:disable all

module ActiveRecord
  class Schema
    def self.define(version:)
      yield
    end
  end
end

class TableWriter
  def initialize(table_name, option)
    @table = {
      name: table_name,
      comment: option[:comment]
    }
    @columns = [
      {
        name: 'id',
        comment: 'id',
        type: 'integer',
        not_null: '○',
        default: '',
        misc: 'PK'
      }
    ]
    @indexes = []
  end

  def index(columns, option)
    @indexes << {
      columns: columns.join(','),
      name: option[:name]
    }
  end

  def method_missing(method, *args)
    opt = args[1]
    not_null = if opt[:null] == false
                 '○'
               else
                 '✕'
               end
    default = opt[:default] ? opt[:default] : ''
    @columns << {
      name: args[0],
      comment: opt[:comment],
      type: method,
      not_null: not_null,
      default: default,
      misc: ''
    }
  end

  def output
    puts %(
      <html>
      <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      </head>
      <body>
    )
    puts %{
<style>
body {
-webkit-print-color-adjust: exact;
}
.sql_table {
  margin: 20px;
}
.indexes {
  page-break-after: always;
  margin-bottom: 20px;
}
h1 {
  font-size: 21px;
}
table {
  border-collapse: collapse;
  width: 1024px;
}
table.table_info {
  width: 600px;
}
th {
  border: 1px solid #fff;
  background: #ccc;
  padding: 8px;
}
td {
  border: 1px solid #ccc;
  padding: 8px;
}
tr:nth-child(even) {
  background: #efefef;
}
tr:hover {
  background: #d1d1d1;
}
      </style>
    }
    puts %( <div class="sql_table"> )
    output_table_info
    output_columns
    output_index
    puts %( </div> )
  end

  private

  def output_table_info
    puts %(
      <table>
      <tbody>
      <tr><th>テーブル定義書</th></tr>
      </tbody>
      </table>
    )
    puts %(
    <h1>テーブル情報</h1>
    <table class="table_info">
    <tbody>
      <tr>
        <th>論理テーブル名</th><td>#{@table[:comment]}</td>
      </tr>
      <tr>
        <th>物理テーブル名</th><td>#{@table[:name]}</td>
      </tr>
    </tbody>
    </table>
    )
  end

  def output_columns
    puts %(
    <h1>カラム情報</h1>
    <table class="columns">
    <tbody>
    <tr>
    <th>No.</th>
    <th>物理カラム名</th>
    <th>論理カラム名</th>
    <th>型</th>
    <th>必須</th>
    <th>初期値</th>
    <th>FK</th>
    <th>備考</th>
    </tr>
    )

    @columns.each.with_index(1) do |c, i|
      puts %(
        <tr>
        <td>#{i}</td>
        <td>#{c[:name]}</td>
        <td>#{c[:comment]}</td>
        <td>#{c[:type]}</td>
        <td>#{c[:not_null]}</td>
        <td>#{c[:default]}</td>
        <td></td>
        <td>#{c[:misc]}</td>
        </tr>
      )
    end

    puts %(
    </tbody>
    </table>
    </body>
    </html>
    )
  end

  def output_index
    puts %(
    <h1>インデックス情報</h1>
    <table class="indexes">
    <tbody>
    <tr>
    <th>No.</th>
    <th>カラム</th>
    <th>名前</th>
    </tr>
    )

    @indexes.each.with_index(1) do |c, i|
      puts %(
        <tr>
        <td>#{i}</td>
        <td>#{c[:columns]}</td>
        <td>#{c[:name]}</td>
        </tr>
      )
    end

    puts %(
    </tbody>
    </table>
    )
  end
end

def create_table(table_name, option)
  writer = TableWriter.new(table_name, option)
  yield writer
  writer.output
end

def method_missing(method, *args); end

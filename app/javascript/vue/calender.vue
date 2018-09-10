<template>
    <div>
        <div id="calendar-nav">
            <i @click="moveLastMonth">先月</i>
            <span v-text="calData.year + year_text"></span>
            <span>{{getMonthName(calData.month)}}</span>
            <i @click="moveNextMonth">翌月</i>
            <table id='calendar' class="table table-bordered">
                <thead class="table-info">
                <tr>
                    <th v-for="week in weeks">
                        {{week}}
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="week in calendar">
                    <td v-for="day in week" v-text="day.day" style="font-size: xx-small"></td>
                </tr>

                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
    export default {
        data: function () {
            return {
                weeks: ['日', '月', '火', '水', '木', '金', '土'],
                calData: {year: 0, month: 0},
                year_text: '年',
            }
        },
        beforeMount: function () {
            let date = new Date();
            this.calData.year = date.getFullYear();
            this.calData.month = date.getMonth() + 1;
        },
        methods: {
            getMonthName: function (month) {
                const monthName = ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'];
                return monthName[month - 1];
            },
            moveLastMonth: function () {
                if (this.calData.month == 1) {
                    this.calData.year--;
                    this.calData.month = 12;
                }
                else {
                    this.calData.month--;
                }
            },
            moveNextMonth: function () {
                if (this.calData.month == 12) {
                    this.calData.year++;
                    this.calData.month = 1;
                }
                else {
                    this.calData.month++;
                }
            }
        },
        computed: {
            calendar: function () {
                // 1日の曜日
                let firstDay = new Date(this.calData.year, this.calData.month - 1, 1).getDay();
                // 晦日の日にち
                let lastDate = new Date(this.calData.year, this.calData.month, 0).getDate();
                // 日にちのカウント
                let dayIdx = 1;

                let calendar = [];
                for (let w = 0; w < 6; w++) {
                    let week = [];
                    // 空白行をなくすため
                    if (lastDate < dayIdx) {
                        break;
                    }

                    for (let d = 0; d < 7; d++) {
                        if (w == 0 && d < firstDay) {
                            week[d] = {day: ''};
                        } else if (w == 6 && lastDate < day) {
                            week[d] = {day: ''};
                            dayIdx++;
                        } else if (lastDate < dayIdx) {
                            week[d] = {day: ''};
                            dayIdx++;
                        } else {
                            week[d] = {day: dayIdx};
                            dayIdx++;
                        }
                    }

                    calendar.push(week);
                }
                return calendar;
            }
        }
    }
</script>

<style scoped>
    table {
        width: 100%;
        table-layout: fixed;
    }

    table td {
        /*word-break: break-all;*/
        overflow-wrap: break-word;
        text-align: center;
        opacity: 0.6;
    }

    #calendar-nav {
        text-align: center;
    }

    #calendar-nav span {
        display: inline-block;
    }

    #calendar-nav i:hover {
        cursor: pointer;
    }

</style>
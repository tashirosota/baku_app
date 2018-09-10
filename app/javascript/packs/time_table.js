import Vue from 'vue'
import TimeTableVue from '../vue/time_table_vue.vue'

    document.addEventListener('DOMContentLoaded', () => {
       new Vue({
           el: '#time_table',
           components: { TimeTableVue }
       })
  });



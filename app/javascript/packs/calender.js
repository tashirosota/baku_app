import Vue from 'vue'
import Calender from '../vue/calender.vue'


document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        el: '#cal',
        components: {Calender},
    })
});


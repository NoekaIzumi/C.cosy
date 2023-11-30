import { createApp } from 'vue'
import App from '../components/App.vue'
import 'jquery'
import 'popper.js'
import 'bootstrap/dist/js/bootstrap'
import '../stylesheets/application.scss'

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(App)
  app.mount('#app')
})
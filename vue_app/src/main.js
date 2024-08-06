import { createApp } from 'vue'
import Demo from './Demo.vue'

const app = createApp(Demo);

// enable devtools for the demo
app.config.devtools = true;

app.mount('#app');
<template>
    <div>
        <div id="hero" class="flex flex-center">
            <div id="nav" class="flex flex-center mono">
                <div id="nav-language">
                    <span class="lang-button">
                        <span v-on:click="setlang('en')" class="en">English</span> / <span v-on:click="setlang('fr')" class="fr">Français</span>
                    </span>
                </div>
            </div>

            <span id="title">David Bourgault</span>
            <span id="subtitle">{{ loc.hero.subtitle[lang] }}</span>

            <div id="contact" class="flex flex-center mono">
                <span>
                    <span>
                        <a href="mailto:contact@davidbourgault.ca">contact@davidbourgault.ca</a>
                    </span>
                    <span> / </span>
                    <span>
                        <a href="https://www.linkedin.com/in/davidbourgault/">linkedin.com/in/davidbourgault</a>
                    </span>
                    <span> / </span>
                    <span>
                        <a href="https://www.github.com/ngc7293/">github.com/ngc7293</a>
                    </span>
                </span>
            </div>
        </div>

        <div id="main">
            <resume :lang="lang" :loc="loc" />
        </div>
    </div>
</template>

<script>
import { defineComponent } from "vue"
import Resume from './components/Resume.vue'
import Locales from './data/locales'

export default defineComponent({
    data() {
        return {
            lang: 'fr',
            loc: Locales
        }
    },
    mounted() {
        app.classList.add(this.lang)
    },
    components: {
        'resume': Resume
    },
    methods: {
        setlang: function(lang) {
            var app = document.getElementById('app')
            app.classList.remove(this.lang)

            if (['fr', 'en'].includes(lang)) {
                this.lang = lang;
            } else {
                this.lang = 'fr';
            }

            app.classList.add(this.lang)
        }
    }
});
</script>
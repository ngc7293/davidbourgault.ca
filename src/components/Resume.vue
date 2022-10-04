<template>
    <div id="cv" class="content">
        <div class="cv-section cv-tech">
            <div class="cv-section-title">
                <span>{{ loc.technologies.title[lang] }}</span>
            </div>

            <div class="flex-v">
                <div v-for="category in loc.technologies.categories" class="cv-tech-category flex">
                    <div class="cv-tech-category-title">
                        <span>{{ category.title[lang] }}</span>
                    </div>
                    <div class="cv-tech-items">
                        <span v-for="item in category.items" class="cv-tech-item mono">{{ item }}</span>
                    </div>
                </div>
            </div>
        </div>
        <div v-for="section in loc.cv.sections" class="cv-section">
            <div class="cv-section-title">
                <span>{{ section.title[lang] }}</span>
            </div>

            <div v-for="item in section.items" class="cv-item flex flex-center">
                <div class="cv-item-date">
                    <div v-for="date in item.dates">
                        <span class="cv-item-date-range">{{ date.start }} - {{ date.end ? date.end :
                                loc.loc.present[lang]
                        }}<br /></span>
                        <span v-if="date.title[lang]" class="cv-item-date-title">{{ date.title[lang]
                        }}<br /></span>
                    </div>
                </div>

                <div class="cv-item-info">
                    <div class="cv-item-header flex flex-center">
                        <span>{{ item.title[lang] }}</span>
                        <span><a :href="item.org.link[lang]">{{ item.org.name }}</a></span>
                    </div>
                    <div class="cv-item-body">
                        <ul>
                            <li v-for="task in item.tasks">{{ task[lang] }}</li>
                        </ul>
                    </div>
                    <div class="mono">
                        <span v-for="tool in item.tools" class="cv-item-tool">{{ tool }}</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="cv-links flex flex-center mono">
            <a :href="loc.cv.pdf.link[lang]" download>{{ loc.cv.pdf.text[lang] }}</a>
        </div>
    </div>
</template>

<script>
import { defineComponent } from "vue"

export default defineComponent({
    props: {
        lang: String,
        loc: Object
    }
});
</script>
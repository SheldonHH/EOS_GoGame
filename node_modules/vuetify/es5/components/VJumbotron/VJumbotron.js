require('../../../src/stylus/components/_jumbotrons.styl');

// Mixins
import Colorable from '../../mixins/colorable';
import Routable from '../../mixins/routable';
import Themeable from '../../mixins/themeable';

export default {
  name: 'v-jumbotron',

  mixins: [Colorable, Routable, Themeable],

  props: {
    gradient: String,
    height: {
      type: [Number, String],
      default: '400px'
    },
    src: String,
    tag: {
      type: String,
      default: 'div'
    }
  },

  computed: {
    backgroundStyles: function backgroundStyles() {
      var styles = {};

      if (this.gradient) {
        styles.background = 'linear-gradient(' + this.gradient + ')';
      }

      return styles;
    },
    classes: function classes() {
      return {
        'theme--dark': this.dark,
        'theme--light': this.light
      };
    },
    styles: function styles() {
      return {
        height: this.height
      };
    }
  },

  methods: {
    genBackground: function genBackground() {
      return this.$createElement('div', {
        staticClass: 'jumbotron__background',
        'class': this.addBackgroundColorClassChecks(),
        style: this.backgroundStyles
      });
    },
    genContent: function genContent() {
      return this.$createElement('div', {
        staticClass: 'jumbotron__content'
      }, this.$slots.default);
    },
    genImage: function genImage() {
      if (!this.src) return null;
      if (this.$slots.img) return this.$slots.img({ src: this.src });

      return this.$createElement('img', {
        staticClass: 'jumbotron__image',
        attrs: { src: this.src }
      });
    },
    genWrapper: function genWrapper() {
      return this.$createElement('div', {
        staticClass: 'jumbotron__wrapper'
      }, [this.genImage(), this.genBackground(), this.genContent()]);
    }
  },

  render: function render(h) {
    var _generateRouteLink = this.generateRouteLink(),
        tag = _generateRouteLink.tag,
        data = _generateRouteLink.data;

    data.staticClass = 'jumbotron';
    data.style = this.styles;

    return h(tag, data, [this.genWrapper()]);
  }
};
// Components
import VAvatar from '../VAvatar';

export default {
  functional: true,

  name: 'v-list-tile-avatar',

  props: {
    color: String,
    size: {
      type: [Number, String],
      default: 40
    }
  },

  render: function render(h, _ref) {
    var data = _ref.data,
        children = _ref.children,
        props = _ref.props;

    data.staticClass = ('list__tile__avatar ' + (data.staticClass || '')).trim();

    var avatar = h(VAvatar, {
      props: {
        color: props.color,
        size: props.size
      }
    }, [children]);

    return h('div', data, [avatar]);
  }
};
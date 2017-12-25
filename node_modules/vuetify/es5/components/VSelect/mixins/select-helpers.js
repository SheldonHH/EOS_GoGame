// Helpers
import { getObjectValueByPath } from '../../../util/helpers';

/**
 * Select helpers
 *
 * @mixin
 *
 * Helper methods for the
 * v-select component
 */
export default {
  methods: {
    getText: function getText(item) {
      return this.getPropertyFromItem(item, this.itemText);
    },
    getValue: function getValue(item) {
      return this.getPropertyFromItem(item, this.itemValue);
    },
    getPropertyFromItem: function getPropertyFromItem(item, field) {
      if (item !== Object(item)) return item;

      var value = getObjectValueByPath(item, field);

      return typeof value === 'undefined' ? item : value;
    }
  }
};
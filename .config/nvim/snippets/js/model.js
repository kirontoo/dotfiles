const { Model } = require( 'objection' );
const dbTableNames = require( '../../constants/dbTableNames' );
const nameSchema = require( './name.schema.json' );

class Table extends Model {
  static get tableName() {
    return dbTableNames.table;
  }

	static get jsonSchema() {
		return nameSchema;
	}
}

module.exports = Table;

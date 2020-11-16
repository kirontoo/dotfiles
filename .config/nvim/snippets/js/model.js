const { Model } = require( 'objection' );
const dbTableNames = require( '../../constants/dbTableNames' );
const nameSchema = require( './name.schema.json' );

class ModelName extends Model {
  static get tableName() {
    return dbTableNames.ModelName;
  }

	static get jsonSchema() {
		return nameSchema;
	}
}

module.exports = ModelName;

const supertest = require( 'supertest' );
const app = require( '../../app' );
const db = require( '../../db' );

afterAll( () => db.destroy() );

describe( 'GET /api/v1/route', () => {
	it( '', async ( done ) => {
		const response = await supertest( app )
			.get( '/api/v1/route' )
			.expect( 'Content-Type', /json/ )
			.expect( 200 );

		expect( response.body );
		done();
	});
});

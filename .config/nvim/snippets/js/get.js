router.get( '/', async ( req, res, next ) => {
	try {
		const tables = await Tablename
			.query()
			.where( 'deleted_at', null );
	} catch ( error ) {
		next( error );
	}
});

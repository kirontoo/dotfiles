router.post( '/', async ( req, res, next ) => {
	try {
		const tables = await Tablename
			.query()
			.insert( req.body );

		return res.json( tables );
	} catch( error ) {
		next( error );
	}
});

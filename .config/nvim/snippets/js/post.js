router.post( '/', async ( req, res, next ) => {
	try {
		const table = await Tablename
			.query()
			.insert( req.body );
		return res.json( table );
	} catch( error ) {
		next( error );
	}
});

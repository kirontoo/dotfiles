router.patch( '/:id', async ( req, res, next ) => {
	try {
		const table = await Tablename
			.query()
			.patchAndFetchById( req.params.id, req.body)

		return res.json( table );
	} catch( error ) {
		next( error );
	}
});

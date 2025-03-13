/**
 * @swagger
 * tags:
 *   name: TypeParcels
 *   description: TypeParcel management and retrieval
 */

/**
 * @swagger
 * /typeParcels:
 *   post:
 *     summary: Create a typeParcel
 *     description: ADMIN can create typeParcel.
 *     tags: [TypeParcels]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/createTypeParcel'
 *     responses:
 *       "201":
 *         description: Created
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: success
 *                 doc:
 *                     $ref: '#/components/schemas/TypeParcel'
 *       "400":
 *         $ref: '#/components/responses/DuplicateEmail'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *
 *   get:
 *     summary: Get all typeParcels
 *     description: USER,ADMIN,EMP can retrieve all typeParcels.
 *     tags: [TypeParcels]
 *     security:
 *       - Bearer: []
 *     parameters:
 *       - in: query
 *         name: fields
 *         schema:
 *           type: string
 *         description: what fields do you want to show (ex. name,price)
 *       - in: query
 *         name: page
 *         schema:
 *           type: integer
 *           minimum: 1
 *           default: 1
 *         description: Page number
 *       - in: query
 *         name: limit
 *         schema:
 *           type: integer
 *           minimum: 1
 *         default: 10
 *         description: Maximum number of typeParcels
 *       - in: query
 *         name: search
 *         schema:
 *           type: string
 *         description: key-words you want to search about it
 *       - in: query
 *         name: agg
 *         schema:
 *           type: string
 *         description: group data by any field  (ex. {group=[brand],max=price,min= price,sum=price,avg=price})
 *       - in: query
 *         name: aggDate
 *         schema:
 *           type: string
 *         description: group data by date fields   (ex. {group=[createdAt],date=month,max=price,min=price,avg=price,year=2022})
 *       - in: query
 *         name: sort
 *         schema:
 *           type: string
 *         description: sort by query in the form of field:desc/asc (ex. name,-price)
 *     responses:
 *       "200":
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: success
 *                 doc:
 *                   type: array
 *                   items:
 *                     $ref: '#/components/schemas/TypeParcel'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 */

/**
 * @swagger
 * /typeParcels/{id}:
 *   get:
 *     summary: Get a typeParcel
 *     description: USER,ADMIN,EMP can use this router.
 *     tags: [TypeParcels]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: TypeParcel id
 *     responses:
 *       "200":
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: success
 *                 doc:
 *                     $ref: '#/components/schemas/TypeParcel'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   patch:
 *     summary: Update a typeParcel
 *     description: ADMIN can use this router.
 *     tags: [TypeParcels]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: TypeParcel id
 *     requestBody:
 *         required: true
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/updateTypeParcel'
 *     responses:
 *       "200":
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: success
 *                 doc:
 *                     $ref: '#/components/schemas/TypeParcel'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   delete:
 *     summary: Delete a  typeParcel.
 *     description: ADMIN can use this router.
 *     tags: [TypeParcels]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: TypeParcel id
 *     responses:
 *       "200":
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: success
 *                 data:
 *                   type: string
 *                   example: null
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 */

exports.TypeParcel = {
  type: 'object',
  properties: {
    id: { type: 'string' },
    // property
    image: { type: 'string' },
    price: { type: 'number' },
    description: { type: 'string' },
    width: { type: 'number' },
    hight: { type: 'number' },
    name: { type: 'string' },
  },
  example: {
    _id: '5ebac534954b54139806c112',
    // property example
    image: './image.jpg',

    price: 200,

    description: 'descrition',

    width: 50,

    hight: 100,

    name: 'big',

    createdAt: '2024-11-24T16:35:04.438Z',
    updatedAt: '2024-11-24T16:35:04.438Z',
  },
};
exports.createTypeParcel = {
  type: 'object',
  properties: {
    // create property
    image: { type: 'string' },
    price: { type: 'number' },
    description: { type: 'string' },
    width: { type: 'number' },
    hight: { type: 'number' },
    name: { type: 'string' },
  },
  example: {
    // create property example
    image: './image.jpg',

    price: 200,

    description: 'descrition',

    width: 50,

    hight: 100,

    name: 'big',
  },
  required: [
    // required property
    'image',

    'price',

    'description',

    'width',

    'hight',

    'name',
  ],
};
exports.updateTypeParcel = {
  type: 'object',
  properties: {
    // update property
    image: { type: 'string' },
    price: { type: 'number' },
    description: { type: 'string' },
    width: { type: 'number' },
    hight: { type: 'number' },
    name: { type: 'string' },
  },
  example: {
    // update property example
    image: './image.jpg',

    price: 200,

    description: 'descrition',

    width: 50,

    hight: 100,

    name: 'big',
  },
};

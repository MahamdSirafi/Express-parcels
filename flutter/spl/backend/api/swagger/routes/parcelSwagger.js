/**
 * @swagger
 * tags:
 *   name: Parcels
 *   description: Parcel management and retrieval
 */

/**
 * @swagger
 * /parcels:
 *   post:
 *     summary: Create a parcel
 *     description: ADMIN,EMP can create parcel.
 *     tags: [Parcels]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/createParcel'
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
 *                     $ref: '#/components/schemas/Parcel'
 *       "400":
 *         $ref: '#/components/responses/DuplicateEmail'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *
 *   get:
 *     summary: Get all parcels
 *     description: USER,ADMIN,EMP can retrieve all parcels.
 *     tags: [Parcels]
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
 *         description: Maximum number of parcels
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
 *                     $ref: '#/components/schemas/Parcel'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 */

/**
 * @swagger
 * /parcels/{id}:
 *   get:
 *     summary: Get a parcel
 *     description: USER,ADMIN,EMP can use this router.
 *     tags: [Parcels]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: Parcel id
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
 *                     $ref: '#/components/schemas/Parcel'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   patch:
 *     summary: Update a parcel
 *     description: ADMIN,EMP can use this router.
 *     tags: [Parcels]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: Parcel id
 *     requestBody:
 *         required: true
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/updateParcel'
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
 *                     $ref: '#/components/schemas/Parcel'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   delete:
 *     summary: Delete a  parcel.
 *     description: ADMIN,EMP can use this router.
 *     tags: [Parcels]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: Parcel id
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

exports.Parcel = {
  type: 'object',
  properties: {
    id: { type: 'string' },
    // property
    receive: {
      type: 'object',
      properties: {
        //  properties receive
        contact: { type: 'string' },

        fullName: { type: 'string' },
      },
    },
    descrtion: { type: 'string' },
    serviceType: { type: 'string' },
    status: { type: 'array', items: { type: 'string', enum: ['Received'] } },
    payment_method: { type: 'string', enum: ['cash', 'Bank'] },
    price: { type: 'number' },
    target_center: { type: 'string' },
    source_center: { type: 'string' },
    user: { type: 'string' },
    typeparcel: { type: 'string' },
  },
  example: {
    _id: '5ebac534954b54139806c112',
    // property example
    receive: {
      // property example receive
      contact: '0945454545',

      fullName: 'adel',
    },

    descrtion: 'desction',

    serviceTypeId: '673c40cd59e293827f79e398',

    status: ['Received'],

    payment_method: 'cash',

    price: 155,

    target_centerId: '673c40cd59e293827f79e398',

    source_centerId: '673c40cd59e293827f79e398',

    userId: '673c40cd59e293827f79e398',

    typeparcelId: '673c40cd59e293827f79e398',

    createdAt: '2024-11-24T16:35:04.438Z',
    updatedAt: '2024-11-24T16:35:04.438Z',
  },
};
exports.createParcel = {
  type: 'object',
  properties: {
    // create property
    receive: {
      type: 'object',
      properties: {
        //  create  properties receive
        contact: { type: 'string' },

        fullName: { type: 'string' },
      },
    },
    descrtion: { type: 'string' },
    serviceType: { type: 'string' },

    target_center: { type: 'string' },

    user: { type: 'string' },
    typeparcel: { type: 'string' },
  },
  example: {
    // create property example
    receive: {
      // create property example receive
      contact: '0945454545',

      fullName: 'adel',
    },

    descrtion: 'desction',

    serviceTypeId: '673c40cd59e293827f79e398',

    target_centerId: '673c40cd59e293827f79e398',

    userId: '673c40cd59e293827f79e398',

    typeparcelId: '673c40cd59e293827f79e398',
  },
  required: [
    // required property

    'receive.fullName',

    'descrtion',

    'serviceType',

    'price',

    'target_center',

    'source_center',

    'user',

    'typeparcel',
  ],
};
exports.updateParcel = {
  type: 'object',
  properties: {
    // update property
    receive: {
      type: 'object',
      properties: {
        //  update properties receive
        contact: { type: 'string' },

        fullName: { type: 'string' },
      },
    },
    descrtion: { type: 'string' },
    serviceType: { type: 'string' },

    target_center: { type: 'string' },

    user: { type: 'string' },
    typeparcel: { type: 'string' },
  },
  example: {
    // update property example
    receive: {
      // update property example receive
      contact: '0945454545',

      fullName: 'adel',
    },

    descrtion: 'desction',

    serviceTypeId: '673c40cd59e293827f79e398',

    target_centerId: '673c40cd59e293827f79e398',

    userId: '673c40cd59e293827f79e398',

    typeparcelId: '673c40cd59e293827f79e398',
  },
};

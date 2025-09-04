/**
 * @swagger
 * tags:
 *   name: Shipments
 *   description: Shipment management and retrieval
 */

/**
 * @swagger
 * /shipments:
 *   post:
 *     summary: Create a shipment
 *     description: ADMIN,EMP can create shipment.
 *     tags: [Shipments]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/createShipment'
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
 *                     $ref: '#/components/schemas/Shipment'
 *       "400":
 *         $ref: '#/components/responses/DuplicateEmail'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *
 *   get:
 *     summary: Get all shipments
 *     description: ADMIN,EMP can retrieve all shipments.
 *     tags: [Shipments]
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
 *         description: Maximum number of shipments
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
 *                     $ref: '#/components/schemas/Shipment'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 */

/**
 * @swagger
 * /shipments/{id}:
 *   get:
 *     summary: Get a shipment
 *     description: ADMIN,EMP can use this router.
 *     tags: [Shipments]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: Shipment id
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
 *                     $ref: '#/components/schemas/Shipment'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   patch:
 *     summary: Update a shipment
 *     description: ADMIN,EMP can use this router.
 *     tags: [Shipments]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: Shipment id
 *     requestBody:
 *         required: true
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/updateShipment'
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
 *                     $ref: '#/components/schemas/Shipment'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   delete:
 *     summary: Delete a  shipment.
 *     description: ADMIN,EMP can use this router.
 *     tags: [Shipments]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: Shipment id
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

exports.Shipment = {
  type: 'object',
  properties: {
    id: { type: 'string' },
    // property
    status: { type: 'string', enum: ['packing', 'delivered'] },
    current_location: {
      type: 'object',
      properties: {
        //  properties current_location
        longitude: { type: 'number' },

        latitude: { type: 'number' },
      },
    },
    source_centerIdId: { type: 'string' },
    description: { type: 'string' },
    source_centerId: { type: 'string' },
    target_centerId: { type: 'string' },
    parcel: { type: 'string' },
  },
  example: {
    _id: '5ebac534954b54139806c112',
    // property example
    status: 'packing',

    current_location: {
      // property example current_location
      longitude: 14,

      latitude: 12,
    },

    source_centerIdIdId: '673c40cd59e293827f79e398',

    description:
      'The shipment departs from Aleppo International Airport or is transported via Damascus International Airport to reach the international transit center.',

    source_centerIdId: '673c40cd59e293827f79e398',

    target_centerIdId: '673c40cd59e293827f79e398',

    parcelId: '673c40cd59e293827f79e398',

    createdAt: '2024-11-24T16:35:04.438Z',
    updatedAt: '2024-11-24T16:35:04.438Z',
  },
};
exports.createShipment = {
  type: 'object',
  properties: {
    // create property
    status: { type: 'string', enum: ['packing', 'delivered'] },
    current_location: {
      type: 'object',
      properties: {
        //  create  properties current_location
        longitude: { type: 'number' },

        latitude: { type: 'number' },
      },
    },

    description: { type: 'string' },
    source_centerId: { type: 'string' },
    target_centerId: { type: 'string' },
    parcel: { type: 'string' },
  },
  example: {
    // create property example
    status: 'packing',

    current_location: {
      // create property example current_location
      longitude: 14,

      latitude: 12,
    },

    description:
      'The shipment departs from Aleppo International Airport or is transported via Damascus International Airport to reach the international transit center.',

    source_centerIdId: '673c40cd59e293827f79e398',

    target_centerIdId: '673c40cd59e293827f79e398',

    parcelId: '673c40cd59e293827f79e398',
  },
  required: [
    // required property

    'current_location.longitude',

    'current_location.latitude',

    'source_centerIdId',

    'source_centerId',

    'target_centerId',

    'parcel',
  ],
};
exports.updateShipment = {
  type: 'object',
  properties: {
    // update property
    status: { type: 'string', enum: ['packing', 'delivered'] },
    current_location: {
      type: 'object',
      properties: {
        //  update properties current_location
        longitude: { type: 'number' },

        latitude: { type: 'number' },
      },
    },

    description: { type: 'string' },
    source_centerId: { type: 'string' },
    target_centerId: { type: 'string' },
    parcel: { type: 'string' },
  },
  example: {
    // update property example
    status: 'packing',

    current_location: {
      // update property example current_location
      longitude: 14,

      latitude: 12,
    },

    description:
      'The shipment departs from Aleppo International Airport or is transported via Damascus International Airport to reach the international transit center.',

    source_centerIdId: '673c40cd59e293827f79e398',

    target_centerIdId: '673c40cd59e293827f79e398',

    parcelId: '673c40cd59e293827f79e398',
  },
};

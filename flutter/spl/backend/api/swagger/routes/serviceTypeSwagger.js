/**
 * @swagger
 * tags:
 *   name: ServiceTypes
 *   description: ServiceType management and retrieval
 */

/**
 * @swagger
 * /serviceTypes:
 *   post:
 *     summary: Create a serviceType
 *     description: ADMIN,EMP can create serviceType.
 *     tags: [ServiceTypes]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/createServiceType'
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
 *                     $ref: '#/components/schemas/ServiceType'
 *       "400":
 *         $ref: '#/components/responses/DuplicateEmail'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *
 *   get:
 *     summary: Get all serviceTypes
 *     description: USER,ADMIN,EMP can retrieve all serviceTypes.
 *     tags: [ServiceTypes]
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
 *         description: Maximum number of serviceTypes
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
 *                     $ref: '#/components/schemas/ServiceType'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 */

/**
 * @swagger
 * /serviceTypes/{id}:
 *   get:
 *     summary: Get a serviceType
 *     description: USER,ADMIN,EMP can use this router.
 *     tags: [ServiceTypes]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: ServiceType id
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
 *                     $ref: '#/components/schemas/ServiceType'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   patch:
 *     summary: Update a serviceType
 *     description: ADMIN,EMP can use this router.
 *     tags: [ServiceTypes]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: ServiceType id
 *     requestBody:
 *         required: true
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/updateServiceType'
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
 *                     $ref: '#/components/schemas/ServiceType'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   delete:
 *     summary: Delete a  serviceType.
 *     description: ADMIN,EMP can use this router.
 *     tags: [ServiceTypes]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: ServiceType id
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

exports.ServiceType = {
  type: 'object',
  properties: {
    id: { type: 'string' },
    // property
    price: { type: 'number' },
    description: { type: 'string' },
    // serviceType: { type: 'string' },
    // insurance: { type: 'array', items: { type: 'string', enum: ['huge'] } },
    // timeForPoint: { type: 'number' },
    name: { type: 'string' },
  },
  example: {
    _id: '5ebac534954b54139806c112',
    // property example
    price: 144,

    description: 'descrption',

    // serviceTypeIds: ['673c40cd59e293827f79e398', '673c40cd59e293827f79e399'],

    // insurance: ['huge'],

    // timeForPoint: 22,

    name: 'quiqly',

    createdAt: '2024-11-24T16:35:04.438Z',
    updatedAt: '2024-11-24T16:35:04.438Z',
  },
};
exports.createServiceType = {
  type: 'object',
  properties: {
    // create property
    price: { type: 'number' },
    description: { type: 'string' },
    // serviceType: { type: 'string' },
    // insurance: { type: 'array', items: { type: 'string', enum: ['huge'] } },
    // timeForPoint: { type: 'number' },
    name: { type: 'string' },
  },
  example: {
    // create property example
    price: 144,

    description: 'descrption',

    // serviceTypeIds: ['673c40cd59e293827f79e398', '673c40cd59e293827f79e399'],

    // insurance: ['huge'],

    // timeForPoint: 22,

    name: 'quiqly',
  },
  required: [
    // required property
    'price',

    'description',

    // 'timeForPoint',

    'name',
  ],
};
exports.updateServiceType = {
  type: 'object',
  properties: {
    // update property
    price: { type: 'number' },
    description: { type: 'string' },
    // serviceType: { type: 'string' },
    // insurance: { type: 'array', items: { type: 'string', enum: ['huge'] } },
    // timeForPoint: { type: 'number' },
    name: { type: 'string' },
  },
  example: {
    // update property example
    price: 144,

    description: 'descrption',

    // serviceTypeIds: ['673c40cd59e293827f79e398', '673c40cd59e293827f79e399'],

    // insurance: ['huge'],

    // timeForPoint: 22,

    name: 'quiqly',
  },
};

/**
 * @swagger
 * tags:
 *   name: Settings
 *   description: Setting management and retrieval
 */

/**
 * @swagger
 * /settings:
 *   post:
 *     summary: Create a setting
 *     description: ADMIN can create setting.
 *     tags: [Settings]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/createSetting'
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
 *                     $ref: '#/components/schemas/Setting'
 *       "400":
 *         $ref: '#/components/responses/DuplicateEmail'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *
 *   get:
 *     summary: Get all settings
 *     description: ADMIN can retrieve all settings.
 *     tags: [Settings]
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
 *         description: Maximum number of settings
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
 *                     $ref: '#/components/schemas/Setting'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 */

/**
 * @swagger
 * /settings/{id}:
 *   get:
 *     summary: Get a setting
 *     description: ADMIN can use this router.
 *     tags: [Settings]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: Setting id
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
 *                     $ref: '#/components/schemas/Setting'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   patch:
 *     summary: Update a setting
 *     description: ADMIN can use this router.
 *     tags: [Settings]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: Setting id
 *     requestBody:
 *         required: true
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/updateSetting'
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
 *                     $ref: '#/components/schemas/Setting'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   delete:
 *     summary: Delete a  setting.
 *     description: ADMIN can use this router.
 *     tags: [Settings]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: Setting id
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

exports.Setting = {
  type: 'object',
  properties: {
    id: { type: 'string' },
    // property
    price: { type: 'number' },
    typeParcelId: { type: 'string' },
    serviceTypeId: { type: 'string' },
    source_centerId: { type: 'string' },
    center_targect: { type: 'string' },
  },
  example: {
    _id: '5ebac534954b54139806c112',
    // property example
    price: 100,

    typeParcelId: '24',

    serviceTypeId: '3456789098764',

    source_centerId: '45678987654',

    center_targect: '34567898765432',

    createdAt: '2024-11-24T16:35:04.438Z',
    updatedAt: '2024-11-24T16:35:04.438Z',
  },
};
exports.createSetting = {
  type: 'object',
  properties: {
    // create property
    price: { type: 'number' },
    typeParcelId: { type: 'string' },
    serviceTypeId: { type: 'string' },
    source_centerId: { type: 'string' },
    center_targect: { type: 'string' },
  },
  example: {
    // create property example
    price: 100,

    typeParcelId: '24',

    serviceTypeId: '3456789098764',

    source_centerId: '45678987654',

    target_centerId: '34567898765432',
  },
  required: [
    // required property
    'price',

    'typeParcelId',

    'serviceTypeId',

    'source_centerId',

    'target_centerId',
  ],
};
exports.updateSetting = {
  type: 'object',
  properties: {
    // update property
    price: { type: 'number' },
    typeParcelId: { type: 'string' },
    serviceTypeId: { type: 'string' },
    source_centerId: { type: 'string' },
    target_centerId: { type: 'string' },
  },
  example: {
    // update property example
    price: 100,

    typeParcelId: '24',

    serviceTypeId: '3456789098764',

    source_centerId: '45678987654',

    target_centerId: '34567898765432',
  },
};

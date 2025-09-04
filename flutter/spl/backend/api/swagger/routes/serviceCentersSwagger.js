/**
 * @swagger
 * tags:
 *   name: ServiceCenters
 *   description: ServiceCenters management and retrieval
 */

/**
 * @swagger
 * /serviceCenters:
 *   post:
 *     summary: Create a serviceCenters
 *     description: ADMIN can create serviceCenters.
 *     tags: [ServiceCenters]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/createServiceCenters'
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
 *                     $ref: '#/components/schemas/ServiceCenters'
 *       "400":
 *         $ref: '#/components/responses/DuplicateEmail'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *
 *   get:
 *     summary: Get all serviceCenters
 *     description: USER,ADMIN,EMP can retrieve all serviceCenters.
 *     tags: [ServiceCenters]
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
 *         description: Maximum number of serviceCenters
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
 *                     $ref: '#/components/schemas/ServiceCenters'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 */

/**
 * @swagger
 * /serviceCenters/{id}:
 *   get:
 *     summary: Get a serviceCenters
 *     description: USER,ADMIN,EMP can use this router.
 *     tags: [ServiceCenters]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: ServiceCenters id
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
 *                     $ref: '#/components/schemas/ServiceCenters'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   patch:
 *     summary: Update a serviceCenters
 *     description: ADMIN can use this router.
 *     tags: [ServiceCenters]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: ServiceCenters id
 *     requestBody:
 *         required: true
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/updateServiceCenters'
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
 *                     $ref: '#/components/schemas/ServiceCenters'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   delete:
 *     summary: Delete a  serviceCenters.
 *     description: ADMIN can use this router.
 *     tags: [ServiceCenters]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: ServiceCenters id
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

exports.ServiceCenters = {
  type: 'object',
  properties: {
    id: { type: 'string' },
    // property
    services_offered: { type: 'array', items: { type: 'string' } },
    special_instructions: { type: 'string' },
    operating_hours: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          //  properties operating_hours
          end: { type: 'string' },

          start: { type: 'string' },

          day: { type: 'string' },
        },
      },
    },
    phone: { type: 'string' },
    address: {
      type: 'object',
      properties: {
        //  properties address
        zip: { type: 'string' },

        city: { type: 'string' },

        street: { type: 'string' },
      },
    },
    name: { type: 'string' },
  },
  example: {
    _id: '5ebac534954b54139806c112',
    // property example
    services_offered: ['For express shipping, home delivery, packaging'],

    special_instructions: 'Please enter your ID when receiving your shipment',

    operating_hours: [
      {
        // property example operating_hours
        end: '7',

        start: '12',

        day: 'sunday',
      },
    ],

    phone: '0956565656',

    address: {
      // property example address
      zip: '3344',

      city: 'aleppo',

      street: 'frqan',
    },

    name: 'aleppo',

    createdAt: '2024-11-24T16:35:04.438Z',
    updatedAt: '2024-11-24T16:35:04.438Z',
  },
};
exports.createServiceCenters = {
  type: 'object',
  properties: {
    // create property
    services_offered: { type: 'array', items: { type: 'string' } },
    special_instructions: { type: 'string' },
    operating_hours: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          //  create  properties operating_hours
          end: { type: 'string' },

          start: { type: 'string' },

          day: { type: 'string' },
        },
      },
    },
    phone: { type: 'string' },
    address: {
      type: 'object',
      properties: {
        //  create  properties address
        zip: { type: 'string' },

        city: { type: 'string' },

        street: { type: 'string' },
      },
    },
    name: { type: 'string' },
  },
  example: {
    // create property example
    services_offered: ['For express shipping, home delivery, packaging'],

    special_instructions: 'Please enter your ID when receiving your shipment',

    operating_hours: [
      {
        // create property example operating_hours
        end: '7',

        start: '12',

        day: 'sunday',
      },
    ],

    phone: '0956565656',

    address: {
      // create property example address
      zip: '3344',

      city: 'aleppo',

      street: 'frqan',
    },

    name: 'aleppo',
  },
  required: [
    // required property
    'services_offered',

    'special_instructions',

    'operating_hours.end',

    'operating_hours.start',

    'operating_hours.day',

    'phone',

    'address.zip',

    'address.city',

    'address.street',

    'name',
  ],
};
exports.updateServiceCenters = {
  type: 'object',
  properties: {
    // update property
    services_offered: { type: 'array', items: { type: 'string' } },
    special_instructions: { type: 'string' },
    operating_hours: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          //  update properties operating_hours
          end: { type: 'string' },

          start: { type: 'string' },

          day: { type: 'string' },
        },
      },
    },
    phone: { type: 'string' },
    address: {
      type: 'object',
      properties: {
        //  update properties address
        zip: { type: 'string' },

        city: { type: 'string' },

        street: { type: 'string' },
      },
    },
    name: { type: 'string' },
  },
  example: {
    // update property example
    services_offered: ['For express shipping, home delivery, packaging'],

    special_instructions: 'Please enter your ID when receiving your shipment',

    operating_hours: [
      {
        // update property example operating_hours
        end: '7',

        start: '12',

        day: 'sunday',
      },
    ],

    phone: '0956565656',

    address: {
      // update property example address
      zip: '3344',

      city: 'aleppo',

      street: 'frqan',
    },

    name: 'aleppo',
  },
};

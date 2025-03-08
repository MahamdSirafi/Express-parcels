/**
 * @swagger
 * tags:
 *   name: Orders
 *   description: Order management and retrieval
 */

/**
 * @swagger
 * /orders:
 *   post:
 *     summary: Create a order
 *     description: EMP can create order.
 *     tags: [Orders]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/createOrder'
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
 *                     $ref: '#/components/schemas/Order'
 *       "400":
 *         $ref: '#/components/responses/DuplicateEmail'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *
 *   get:
 *     summary: Get all orders
 *     description: ADMIN,EMP can retrieve all orders.
 *     tags: [Orders]
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
 *         description: Maximum number of orders
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
 *                     $ref: '#/components/schemas/Order'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 */

/**
 * @swagger
 * /orders/{id}:
 *   get:
 *     summary: Get a order
 *     description: ADMIN,EMP can use this router.
 *     tags: [Orders]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: Order id
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
 *                     $ref: '#/components/schemas/Order'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   patch:
 *     summary: Update a order
 *     description: EMP can use this router.
 *     tags: [Orders]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: Order id
 *     requestBody:
 *         required: true
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/updateOrder'
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
 *                     $ref: '#/components/schemas/Order'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   delete:
 *     summary: Delete a  order.
 *     description: EMP can use this router.
 *     tags: [Orders]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: Order id
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

exports.Order = {
  type: 'object',
  properties: {
    id: { type: 'string' },
    // property
confirmed: { type: 'boolean',},
order_status: { type: 'string',},
payment_method: { type: 'string',},
tolal_price: { type: 'number',},
    item: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          //  properties item
type: { type: 'string',},

image_url: { type: 'string',},

is_fragile: { type: 'boolean',},

weight: { type: 'number',},

          description: { type: 'string' },

          item_name: { type: 'string' },
        },
      },
    },
    name: { type: 'string' },
    source_laction: { type: 'string' },
    user: { type: 'string' },
  },
  example: {
    _id: '5ebac534954b54139806c112',
    // property example
confirmed: 1,

order_status: 'Successfully completed',

payment_method: 'Bank payment',

tolal_price: 299,

    item: [
      {
        // property example item
type: 'Clothing and fabrics',

image_url: '',

is_fragile: true,

weight: 15,

        description:
          'Legal papers are legal documents that prove rights and obligations such as a passport.',

        item_name: 'Legal papers',
      },
    ],

    name: '&#34;Standard Delivery&#34;',

    source_lactionId: '673c40cd59e293827f79e398',

    userId: '673c40cd59e293827f79e398',

    createdAt: '2024-11-24T16:35:04.438Z',
    updatedAt: '2024-11-24T16:35:04.438Z',
  },
};
exports.createOrder = {
  type: 'object',
  properties: {
    // create property
confirmed: { type: 'boolean',},
order_status: { type: 'string',},
payment_method: { type: 'string',},
tolal_price: { type: 'number',},
    item: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          //  create  properties item
type: { type: 'string',},

image_url: { type: 'string',},

is_fragile: { type: 'boolean',},

weight: { type: 'number',},

          description: { type: 'string' },

          item_name: { type: 'string' },
        },
      },
    },
    name: { type: 'string' },

    user: { type: 'string' },
  },
  example: {
    // create property example
confirmed: 1,

order_status: 'Successfully completed',

payment_method: 'Bank payment',

tolal_price: 299,

    item: [
      {
        // create property example item
type: 'Clothing and fabrics',

image_url: '',

is_fragile: true,

weight: 15,

        description:
          'Legal papers are legal documents that prove rights and obligations such as a passport.',

        item_name: 'Legal papers',
      },
    ],

    name: '&#34;Standard Delivery&#34;',

    userId: '673c40cd59e293827f79e398',

    createdAt: '2024-11-24T16:35:04.438Z',
    updatedAt: '2024-11-24T16:35:04.438Z',
  },
  required: [
    // required property
'confirmed', 

'order_status', 

'payment_method', 


'item.type', 

'item.image_url', 

'item.is_fragile', 

'item.weight', 

    'item.description',

    'item.item_name',

    'source_laction',

    'user',
  ],
};
exports.updateOrder = {
  type: 'object',
  properties: {
    // update property
confirmed: { type: 'boolean',},
order_status: { type: 'string',},
payment_method: { type: 'string',},
tolal_price: { type: 'number',},
    item: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          //  update properties item
type: { type: 'string',},

image_url: { type: 'string',},

is_fragile: { type: 'boolean',},

weight: { type: 'number',},

          description: { type: 'string' },

          item_name: { type: 'string' },
        },
      },
    },
    name: { type: 'string' },

    user: { type: 'string' },
  },
  example: {
    // update property example
confirmed: 1,

order_status: 'Successfully completed',

payment_method: 'Bank payment',

tolal_price: 299,

    item: [
      {
        // update property example item
type: 'Clothing and fabrics',

image_url: '',

is_fragile : true,

weight: 15,

        description:
          'Legal papers are legal documents that prove rights and obligations such as a passport.',

        item_name: 'Legal papers',
      },
    ],

    name: '&#34;Standard Delivery&#34;',

    userId: '673c40cd59e293827f79e398',

    createdAt: '2024-11-24T16:35:04.438Z',
    updatedAt: '2024-11-24T16:35:04.438Z',
  },
};

export const schema = {
  type: 'object',
  required: ['templateName', 'authors', 'description', 'encoding', 'instructions'],
  properties: {
    templateName: {
      type: 'string',
      title: 'Template Name',
      default: '',
    },
    description: {
      type: 'string',
      title: 'Description',
    },
    parameters: {
      title: 'Parameters',
      description:
        'Enter a parameter that will be used within the DAX template',
      type: 'array',
      minItems: 1,
      required:['parameterKey','displayName','dataType','selectionKind'],
      items: {
        type: 'object',
        properties: {
          parameterKey: {
            type: 'string',
            title: 'Unique Identifier for Parameter *',
            default: '__Parameter1',
          },
          displayName: {
            type: 'string',
            title: 'Parameter Name *',
          },
          defaultValue: {
            type: 'string',
            title:
              'Default Value Set by Parameter ( leave blank if no default )',
          },
          description: {
            type: 'string',
            title: 'Description for Parameter',
          },
          dataType: {
            type: 'array',
            title: 'Data Type *',
            items: {
              type: 'string',
              enum: ['string', 'number', 'date', 'true / false'],
            },
            uniqueItems: true,
          },
          selectionKind: {
            type: 'string',
            title: 'Parameter Input Selection *',
            oneOf: [
              {
                title: 'Measure',
                const: 'measure',
              },
              {
                title: 'Table[Column]',
                const: 'table[Column]',
              },
              {
                title: 'Table',
                const: 'table',
              },
              {
                title: 'Column',
                const: 'column',
              },
              {
                title: 'Date',
                const: 'date',
              },
              {
                title: 'User Input',
                const: 'userInput',
              },
              {
                title: 'User Input or From Data Model',
                const: 'userInputModel',
              },
            ],
          },
        },
      },
    },
    encoding: {
      type: 'array',
      minItems: 1,
      items: {
        type: 'object',
        required:['objectType','name','expression'],
        properties: {
          objectType: {
            type: 'string',
            title: 'Parameter Input Selection *',
            oneOf: [
              {
                title: 'Measure',
                const: 'measure',
              },
              {
                title: 'Table',
                const: 'table',
              },
              {
                title: 'Calculated Column',
                const: 'column',
              },
            ],
          },
          name: {
            type: 'string',
            title: 'Enter a Name for the Object',
          },
          expression: {
            type: 'string',
            title: 'Expression / Formula',
          },
          description: {
            type: 'string',
            title: 'Description of the Measure',
          },
          folder: {
            type: 'string',
            title:
              'Enter a of a Folder to place the Measure in ( leave blank if no folder needed )',
          },
          hidden: {
            type: 'string',
            title: 'Hide the Measure by Default',
                
                oneOf: [
                  {
                    title: 'Yes',
                    const: 'true',
                  },
                  {
                    title: 'No',
                    const: 'false',
                  },
                ],
          },
          format: {
            type: 'object',
            title: 'Choose formatting options',
            properties: {
              formatString: {
                type: 'string',
                title: 'Pick Formatting Options',
                oneOf: [
                  {
                    title: 'General',
                    const: 'general',
                  },
                  {
                    title: 'Whole Number',
                    const: 'whole',
                  },
                  {
                    title: 'Decimal Number',
                    const: 'decimal',
                  },
                  {
                    title: 'Currency',
                    const: 'currency',
                  },
                  {
                    title: 'Percentage',
                    const: 'percentage',
                  },
                  {
                    title: 'Scientific',
                    const: 'scientific',
                  },
                ],
              },
              UseParenthesisForNegativeValues: {
                type: 'string',
                title: 'Use Parenthesis For Negative Values',
                oneOf: [
                  {
                    title: 'Yes',
                    const: 'true',
                  },
                  {
                    title: 'No',
                    const: 'false',
                  },
                ],
              },
              UseThousandSeparator: {
                type: 'string',
                title: 'Use Thousand Separator',
                oneOf: [
                  {
                    title: 'Yes',
                    const: 'true',
                  },
                  {
                    title: 'No',
                    const: 'false',
                  },
                ],
              },
            },
          },
        },
      },
    },
    authors: {
      type: 'array',
      title: 'Authors *',
      minItems: 1,
      items: {
        type: 'string',
      },
    },
    supportURLs: {
      type: 'array',
      title: 'Support URLs',
      items: {
        type: 'string',
      },
    },
    tags: {
      type: 'array',
      title: 'Tags',
      items: {
        type: 'string',
      },
    },
    instructions: {
      type: 'array',
      title: 'Instructions *',
      minItems: 1,
      items: {
        type: 'string',
      },
    },
  },
}
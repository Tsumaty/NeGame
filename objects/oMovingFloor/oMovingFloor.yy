{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "oMovingFloor",
  "spriteId": {
    "name": "sFloor",
    "path": "sprites/sFloor/sFloor.yy",
  },
  "solid": false,
  "visible": true,
  "managed": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "oPlatform",
    "path": "objects/oPlatform/oPlatform.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":2,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":1,"eventType":2,"collisionObjectId":null,},
  ],
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"horsp","varType":0,"value":"0","rangeEnabled":true,"rangeMin":-900.0,"rangeMax":900.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"versp","varType":0,"value":"0","rangeEnabled":true,"rangeMin":-900.0,"rangeMax":900.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"maxhorsp","varType":0,"value":"180","rangeEnabled":true,"rangeMin":0.0,"rangeMax":900.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"maxversp","varType":0,"value":"0","rangeEnabled":true,"rangeMin":0.0,"rangeMax":900.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"horAccelRate","varType":0,"value":"0.15","rangeEnabled":true,"rangeMin":0.0,"rangeMax":1.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"verAccelRate","varType":0,"value":"0.15","rangeEnabled":true,"rangeMin":0.0,"rangeMax":1.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"changeDirPeriod","varType":0,"value":"0.5","rangeEnabled":true,"rangeMin":0.0,"rangeMax":2.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"canChangeDirTime","varType":0,"value":"0.75","rangeEnabled":true,"rangeMin":0.0,"rangeMax":2.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"movingBorderLeft","varType":0,"value":"x - 100","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"movingBorderRight","varType":0,"value":"x + 100","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"movingBorderTop","varType":0,"value":"y - 100","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"movingBorderBottom","varType":0,"value":"y + 100","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"movesCyclically","varType":3,"value":"True","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
  ],
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"frictForce","path":"objects/oStand/oStand.yy",},"objectId":{"name":"oStand","path":"objects/oStand/oStand.yy",},"value":"24",},
  ],
  "parent": {
    "name": "Obstacles",
    "path": "folders/Objects/Obstacles.yy",
  },
}
const directory = require('./directory.json').data

exports.directory = directory

const by_uuid = {}
directory.forEach(function (entry) {
    by_uuid[entry.uuid] = entry
})

exports.by_uuid = by_uuid

exports.reportIssues = 'https://github.com/AnIrishDuck/banking-directory/issues'


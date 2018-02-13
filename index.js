const directory = require('./directory.json').data

exports.directory = directory

const byUuid = {}
directory.forEach(function (entry) {
    byUuid[entry.uuid] = entry
})

exports.byUuid = byUuid

exports.reportIssues = 'https://github.com/AnIrishDuck/banking-directory/issues'


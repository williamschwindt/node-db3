const db = require('../data/config');

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes')
        .where('id', id).first()
}

function findSteps(id) {
    return db('schemes')
        .leftJoin('steps as s', 's.scheme_id', 'schemes.id')
        .select('s.id', 'schemes.scheme_name', 's.step_number', 's.instructions')
        .where('schemes.id', id)
        .orderBy('s.step_number')
}

function add(scheme) {
    return db('schemes')
      .insert(scheme)
      .then(([id]) => findById(id));
  }

function update(changes, id) {
    return db('schemes')
        .where('schemes.id', id)
        .update(changes)
}

function remove(id) {
    return db('schemes')
        .where('schemes.id', id)
        .del()
}

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}
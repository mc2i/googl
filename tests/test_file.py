from util.relation import Relation
from . import file, File


def test_files(paths):
    files = [File.sync(p) for p in paths]
    assert Relation(paths, File(parents=['root']).match(pattern='tmp'),
                    file.equal).one_to_one()
    for f in files: File.delete(f)

def dups_test(path):
    assert not file.dups(path) 
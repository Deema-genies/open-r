CREATE TABLE atom (
    atom_id text PRIMARY KEY             -- Example: 'TR000_1',
    molecule_id text                     -- Example: 'TR000',
    element text                         -- Example: 'cl',
    FOREIGN KEY (molecule_id) REFERENCES molecule(molecule_id)
);

CREATE TABLE bond (
    bond_id text PRIMARY KEY             -- Example: 'TR000_1_2',
    molecule_id text                     -- Example: 'TR000',
    bond_type text                       -- Example: '-',
    FOREIGN KEY (molecule_id) REFERENCES molecule(molecule_id)
);

CREATE TABLE connected (
    atom_id text                         -- Example: 'TR000_1',
    atom_id2 text                        -- Example: 'TR000_2',
    bond_id text                         -- Example: 'TR000_1_2',
    PRIMARY KEY (atom_id, atom_id2),
    FOREIGN KEY (bond_id) REFERENCES bond(bond_id),
    FOREIGN KEY (atom_id2) REFERENCES atom(atom_id),
    FOREIGN KEY (atom_id) REFERENCES atom(atom_id)
);

CREATE TABLE molecule (
    molecule_id text PRIMARY KEY         -- Example: 'TR000',
    label text                           -- Example: '+'
);
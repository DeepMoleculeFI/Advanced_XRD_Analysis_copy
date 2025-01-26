docker build -t xrd-analysis-env .

docker run -it --gpus all -v C:\Users\janny\Startup\DeepMolecule\Advanced_XRD_Analysis_copy:/workspace xrd-analysis-env


# Info

The 7 Crystal Systems

Triclinic

No symmetry constraints (lowest symmetry).

Monoclinic

One 2-fold axis or mirror plane.

Orthorhombic

Three perpendicular 2-fold axes or mirror planes.

Tetragonal

One 4-fold symmetry axis.

Trigonal

One 3-fold symmetry axis.

Hexagonal

One 6-fold symmetry axis.

Cubic

Four 3-fold axes (highest symmetry).

## Classification Summary

| Classification | Classes | Purpose                                | Example Use Case                     |
|----------------|---------|----------------------------------------|--------------------------------------|
| **CS**         | 7       | Broad lattice symmetry (e.g., cubic).  | Initial screening of crystal systems.|
| **EG**         | 101     | Intermediate symmetry groups.          | Narrowing down indexing candidates.  |
| **SG**         | 230     | Full atomic symmetry description.      | Final refinement of crystal structure.|
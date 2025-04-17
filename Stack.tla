-------------------------- MODULE Stack  --------------------------

\* https://jack-vanlightly.com/blog/2023/10/10/the-importance-of-liveness-properties-part-2

EXTENDS Naturals, Sequences

CONSTANTS 
    CAPACITY

VARIABLES
    top,
    items

vars == << top, items >>

TypeOK ==
    /\ top \in Nat
    /\ top <= CAPACITY
\* TODO /\ items \in 

Init ==
    /\ top = 0
    /\ items = << >>    

Add == \E v \in 0 .. 10 : 
    /\ top < CAPACITY
    /\ top' = top + 1
    /\ items' = << v >> \o items

Remove == 
    /\ top > 0
    /\ top' = top - 1
    /\ items' = Tail(items)

Next ==
    \/ Add
    \/ Remove

Spec == Init /\ [][Next]_<<vars>>

\* TODO suitable invariants and properties

====

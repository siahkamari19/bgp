%% Rule 1: Capture domain constants
dom(a).

% Rule 2: Capture database facts
s(a, td).

% Rule 3: Repair by making q(X) true or s(X) false when q(X) is false
s(X, fa) | q(X, ta) :- s(X, ts), q(X, fa), dom(X).

% Rule 4: Repair by making q(X) true or s(X) false when q(X) is not true in the database
s(X, fa) | q(X, ta) :- s(X, ts), not q(X, td), dom(X).

% Rule 5: Capture atoms that are true in the program for s and q
s(X, ts) :- s(X, td), dom(X).
s(X, ts) :- s(X, ta), dom(X).
q(X, ts) :- q(X, td), dom(X).
q(X, ts) :- q(X, ta), dom(X).

% Rule 6: Capture atoms that become true in the repairs for s and q
s(X, tss) :- s(X, ta).
s(X, tss) :- s(X, td), not s(X, fa).
q(X, tss) :- q(X, ta).
q(X, tss) :- q(X, td), not q(X, fa).

% Rule 7: Denial constraints to avoid contradictory states
:- s(X, ta), s(X, fa).
:- q(X, ta), q(X, fa).

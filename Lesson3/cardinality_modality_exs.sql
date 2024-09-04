-- What is cardinality?
-- ANS: Cardinality is a property of relationships between entities in our problem
-- domain. In particular, the cardinality of a relationship describes whether the
-- entities relate one-to-one, one-to-many, or many-to-many.

-- What is modality?
-- ANS: Modality is a property of relationships between entities in our problem
-- domain. In particular, the cardinality of a relationship describes whether it's
-- *necessary* for an entity of one to be related to an entity of the other type. 
-- The modality of a relationship can be asymmetric. Maybe X's can only exist in
-- the database if they are related to 1+ Y's while Y's can exist in the database
-- without or without being related to any X's.
-- We normally use 0's and 1's to indicate modality. If a X's necessarily must
-- relate to Y's, then that's a modality of 1. If X's don't necessarily need to 
-- relate to a Y, then that's a modality of 0.

-- If one side of a relationship has a modality of 1, what is the smallest number
--  of instances that can be on that side of the relationship?
-- ANS: One

-- What type of notation was described in depth throughout most of the video?
-- ANS: Crow's Foot
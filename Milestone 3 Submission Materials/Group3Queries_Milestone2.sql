/* Group 3 Queries - Milestone 2
Working document to assemble the quries we want to to submit 
Uncomment code to run specified query
*/

/*
/* Chris Query # */
select FACILITY.FacilityName, EQUIPMENT_TYPE.EquipmentName, EQUIPMENT_AVAILABLE.QuantityAvailable
from ((EQUIPMENT_TYPE
inner join EQUIPMENT_AVAILABLE on EQUIPMENT_TYPE.idEQUIPMENT_TYPE = EQUIPMENT_AVAILABLE.EquipmentType)
inner join FACILITY on FACILITY.idFACILITY = EQUIPMENT_AVAILABLE.facility)
where FACILITY.FacilityName = 'Globo Gym';
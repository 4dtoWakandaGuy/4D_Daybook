If (False:C215)
	//object Name: [COMPANIES]dStatsView13.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SV_at_TableFindCodes;0)
	//array Text(DB_at_TableName;0)
	//Array LONGINT(SV_al_TableNumber;0)
	C_LONGINT:C283(bd2)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStatsView13.Variable6"; Form event code:C388)
//DB_at_TableName script
If ((DB_at_TableName=0) & (bd2#0))
	DB_at_TableName:=bd2
End if 
If (DB_at_TableName#bd2)
	SV_al_TableNumber:=DB_at_TableName
	SV_at_TableFindCodes:=DB_at_TableName
	StatsView_Find
	StatsView_ArF3(SV_al_TableNumber{SV_al_TableNumber})
	StatsView_Cal2
End if 
bd2:=DB_at_TableName
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStatsView13.Variable6"; $_t_oldMethodName)
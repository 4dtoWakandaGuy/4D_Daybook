//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_LoadPotentialRelationsNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_AL_RELCONTEXTEXTID;0)
	//ARRAY LONGINT(SD2_al_DiaryRelatedContextID;0)
	//ARRAY LONGINT(SD2_al_DiaryRelatedField;0)
	//ARRAY LONGINT(SD2_al_DiaryrelatedTable;0)
	//ARRAY TEXT(SD2_at_RELCONTEXT;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadPotentialRelationsNames")
//This method will load the 'traditional ' relations to the diary
//THERE MAY BE OTHER RELATIONS O
ARRAY LONGINT:C221(SD2_al_DiaryrelatedTable; 0)
ARRAY LONGINT:C221(SD2_al_DiaryRelatedContextID; 0)
ARRAY LONGINT:C221(SD2_al_DiaryRelatedField; 0)
//The contexts exist to enable multi use of related tables
ARRAY TEXT:C222(SD2_at_RELCONTEXT; 0)
ARRAY LONGINT:C221(SD_AL_RELCONTEXTEXTID; 0)
//AA_LOADAA_LoadListERR_MethodTrackerReturn ("SD2_LoadPotentialRelationsNames";$_t_oldMethodName)
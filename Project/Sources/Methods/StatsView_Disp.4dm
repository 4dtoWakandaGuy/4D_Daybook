//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_Disp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/03/2010 17:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_CalcOption3;0)
	//ARRAY TEXT(SV_at_CalcOption4;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	//ARRAY TEXT(SV_at_FieldName3;0)
	//ARRAY TEXT(SV_at_FieldName4;0)
	C_BOOLEAN:C305(vSVReadOnly)
	C_LONGINT:C283($_l_WIndowBottom; $_l_WindowLeft; $_l_WIndowRight; $_l_WindowTop; vNo; vSNo)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $1; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_Disp")

StatsView_Arr(0; 0)
If (Size of array:C274(DB_at_TableName)>0)
	DB_at_TableName:=1
	SV_al_TableNumber:=1
	
	StatsView_ArF3(SV_al_TableNumber{SV_al_TableNumber})  //Is the one selected
	
	ARRAY TEXT:C222(SV_at_CalcOption3; 4)
	SV_at_CalcOption3{1}:="Sum of"
	SV_at_CalcOption3{2}:="Average"
	SV_at_CalcOption3{3}:="Highest"
	SV_at_CalcOption3{4}:="Lowest"
	SV_at_CalcOption3:=1
	COPY ARRAY:C226(SV_at_CalcOption3; SV_at_CalcOption4)
	SV_at_CalcOption4:=1
	
	vNo:=Records in selection:C76($2->)
	vSNo:=1  //Used for graph type
	
	vSVReadOnly:=Read only state:C362($2->)
	UNLOAD RECORD:C212($2->)
	READ ONLY:C145($2->)
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WIndowRight; $_l_WIndowBottom)
	
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+549; $_l_WindowTop+370)
	
	DIALOG:C40([COMPANIES:2]; "dStatsView13")  //NG April 2004 Removed ◊Screen\r"
	StatsView_Arr(0; 0)
	StatsView_ArFi(0)
	ARRAY TEXT:C222(SV_at_FieldName1; 0)  //was 15 pre 4.0.037
	ARRAY TEXT:C222(SV_at_FieldName3; 0)  //was 15 pre 4.0.037
	ARRAY TEXT:C222(SV_at_FieldName4; 0)  //was 15 pre 4.0.037
	ARRAY TEXT:C222(SV_at_CalcOption3; 0)
	ARRAY TEXT:C222(SV_at_CalcOption4; 0)
End if 
ERR_MethodTrackerReturn("StatsView_Disp"; $_t_oldMethodName)

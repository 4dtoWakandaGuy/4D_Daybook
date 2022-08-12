//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_Title
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
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_CalcOption4;0)
	//Array TEXT(SV_at_CalcOption3;0)
	//Array TEXT(SV_at_FieldName1;0)
	//Array TEXT(SV_at_FieldName3;0)
	//Array TEXT(SV_at_FieldName4;0)
	C_LONGINT:C283(bd11; bd13; bd14)
	C_TEXT:C284($_t_oldMethodName; vTitle2; vTitle3; vTitle4; vTitle5; vTitle6; vTitle7; vTitle8; vTitle9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_Title")
vTitle2:="Analysis:"
vTitle3:=SV_at_FieldName1{SV_at_FieldName1}
If (bd13=1)
	vTitle3:=vTitle3+" ("+String:C10(bd14)+" Char"+("s"*(Num:C11(bd14>1)))+")"
End if 
vTitle4:=Uppers2(Lowercase:C14(DB_at_TableName{DB_at_TableName}))
If ((bd11=1) & (DB_at_TableName#1))
	vTitle4:=vTitle4+" (Found)"
End if 
vTitle5:="Count"
vTitle6:=SV_at_CalcOption3{SV_at_CalcOption3}
vTitle7:=SV_at_FieldName3{SV_at_FieldName3}
vTitle8:=SV_at_CalcOption4{SV_at_CalcOption4}
vTitle9:=SV_at_FieldName4{SV_at_FieldName4}
ERR_MethodTrackerReturn("StatsView_Title"; $_t_oldMethodName)
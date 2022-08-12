//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Pictures_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Clash; vAdd)
	C_TEXT:C284($_t_oldMethodName; $_t_PictureCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vButtDisPICTURES)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Pictures_InLPB")
If ((vAdd=1) & (DB_t_CurrentFormUsage3="FurthFld:@"))
	
	Repeat 
		$_t_PictureCode:=Substring:C12(DB_t_CurrentFormUsage; 1; 3)+"/"+String:C10(AA_GetNextIDinMethod(->[PICTURES:85]Picture_Code:1; Sequence number:C244([PICTURES:85])))
		SET QUERY DESTINATION:C396(3; $_l_Clash)
		QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=$_t_PictureCode)
		SET QUERY DESTINATION:C396(0)
	Until ($_l_Clash=0)
	
	[PICTURES:85]Picture_Code:1:=$_t_PictureCode
	[PICTURES:85]Picture_Name:2:=DB_t_CurrentFormUsage2+" "+Substring:C12(DB_t_CurrentFormUsage; 4; 99)+" "+DB_t_CurrentFormUsage3
End if 
If ([PICTURES:85]Picture_Code:1#"")
	GOTO OBJECT:C206([PICTURES:85]Picture_Name:2)
End if 
If ([PICTURES:85]Format:4="")
	[PICTURES:85]Format:4:="1"
End if 
//SET FORMAT([PICTURES]Picture;[PICTURES]Format)
If (DB_t_CurrentFormUsage3="Further Field:@")
	vButtDisPICTURES:="I  PMO  FSSSRCA T"
Else 
	vButtDisPICTURES:="I  PMO  FSSSRCADT"
End if 
Input_Buttons(->[PICTURES:85]; ->vButtDisPICTURES)
Macro_AccType("Load "+String:C10(Table:C252(->[PICTURES:85])))
ERR_MethodTrackerReturn("Pictures_InLPB"; $_t_oldMethodName)

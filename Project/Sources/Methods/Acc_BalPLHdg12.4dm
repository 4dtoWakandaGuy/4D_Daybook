//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalPLHdg12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified; vMod2)
	C_LONGINT:C283($_l_PrintHeight; ch6; s1; vControl)
	C_POINTER:C301($1)
	C_REAL:C285($0; vT1; vT10; vT11; vT12; vT2; vT3; vT4; vT5; vT6; vT7)
	C_REAL:C285(vT8; vT9; vTot)
	C_TEXT:C284($_t_oldMethodName; vHeading; vRec; vTerms)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalPLHdg12")
vControl:=3*([HEADINGS:84]Heading_Level:3-1)
vHeading:=(" "*vControl)+[HEADINGS:84]Heading_Name:2
vT1:=0
vT2:=0
vT3:=0
vT4:=0
vT5:=0
vT6:=0
vT7:=0
vT8:=0
vT9:=0
vT10:=0
vT11:=0
vT12:=0
vTot:=0

If (ch6=0)
	If (s1=1)
		Acc_BalPage12(1; 2; "PL_Header12")
		
		$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Heading12")
		If (Count parameters:C259>=1)
			$1->:=$_l_PrintHeight
		End if 
		
	Else 
		SEND PACKET:C103(vHeading+vRec)
	End if 
End if 

If ([HEADINGS:84]Heading_Level:3=1)
	vTerms:=[HEADINGS:84]Heading_Code:1+"@"
	vMod2:=True:C214
	DB_bo_RecordModified:=True:C214  //Used to tell the main proc to clear totals
	//  vStockLevel:=1
Else 
	DB_bo_RecordModified:=True:C214
End if 
ERR_MethodTrackerReturn("Acc_BalPLHdg12"; $_t_oldMethodName)

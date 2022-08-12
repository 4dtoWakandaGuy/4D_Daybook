//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters_InSWTem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 10:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array Text(<>WP_at_DocumentDiaryActionCode;0)
	//_o_Array Text(GEN_at_Identity;0)
	//array Text(GEN_at_Name;0)
	C_LONGINT:C283(r0)
	C_TEXT:C284($_t_actionCode; $_t_oldMethodName; $1; vTitle4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_InSWTem")
//Letters_InSWTem - searches for the Templates for the dAsk DocSW layout
If (Count parameters:C259>=1)
	$_t_actionCode:=$1
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Type:13=<>WP_at_DocumentDiaryActionCode{<>WP_at_DocumentDiaryActionCode})
Else 
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Type:13=<>WP_at_DocumentDiaryActionCode{<>WP_at_DocumentDiaryActionCode}; *)
End if 
If (r0=1)
	QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Standard:9=True:C214)
Else 
	QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Standard:9=False:C215)
End if 
If (Records in selection:C76([DOCUMENTS:7])>50)
	MESSAGES OFF:C175
	ORDER BY:C49([DOCUMENTS:7]; [DOCUMENTS:7]Standard:9; <)
	REDUCE SELECTION:C351([DOCUMENTS:7]; 50)
	MESSAGES ON:C181
	vTitle4:="(Last 50 only)"
Else 
	vTitle4:=""
End if 
Array_LCx(0)
If (Records in selection:C76([DOCUMENTS:7])=0)
	INSERT IN ARRAY:C227(GEN_at_Identity; 1; 1)
	INSERT IN ARRAY:C227(GEN_at_Name; 1; 1)
	GEN_at_Identity{1}:="Not defined"
Else 
	SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; GEN_at_Identity; [DOCUMENTS:7]Heading:2; GEN_at_Name)
	SORT ARRAY:C229(GEN_at_Identity; GEN_at_Name; >)
End if 
GEN_at_Name:=1
GEN_at_Identity:=1
ERR_MethodTrackerReturn("Letters_InSWTem"; $_t_oldMethodName)
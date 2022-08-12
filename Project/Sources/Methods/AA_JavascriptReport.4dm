//%attributes = {}

If (False:C215)
	//Database Method Name:      AA_JavascriptReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  30/09/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Paths; 0)
	C_BOOLEAN:C305($_bo_CallsMethod)
	C_LONGINT:C283($_l_ClassPosition; $_l_HeaderPosition; $_l_Index; $_l_Index2; $_l_MethodPosition; $_l_ReturnPosition)
	C_TEXT:C284($_t_MethodHeader; $_t_oldMethodName; $_t_SubHeader; $_t_SubHeaderStyle2; $DB_t_MethodTextOLD; DB_t_MethodText)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("AA_JavascriptReport")

$_l_HeaderPosition:=Position:C15($_t_MethodHeader; DB_t_MethodText)
If ($_l_HeaderPosition>0)
	DB_t_MethodText:=Substring:C12(DB_t_MethodText; $_l_HeaderPosition+Length:C16($_t_MethodHeader))
End if 
$_t_SubHeader:="comment added and reserved by 4D.\r"
$_l_HeaderPosition:=Position:C15($_t_SubHeader; DB_t_MethodText)
If ($_l_HeaderPosition>0)
	DB_t_MethodText:=Substring:C12(DB_t_MethodText; $_l_HeaderPosition+Length:C16($_t_SubHeader))
End if 
$_t_SubHeaderStyle2:="•••comment added and reserved by 4D.•••\r"
$_l_HeaderPosition:=Position:C15($_t_SubHeaderStyle2; DB_t_MethodText)
If ($_l_HeaderPosition>1)
	DB_t_MethodText:=Replace string:C233(DB_t_MethodText; "•••comment added and reserved by 4D.•••\r"; "")
End if 
If ($_l_HeaderPosition=1)
	DB_t_MethodText:=Substring:C12(DB_t_MethodText; $_l_HeaderPosition+Length:C16($_t_SubHeaderStyle2))
End if 
$_t_SubHeaderStyle2:="••comment added and reserved by 4D.••\r"
$_l_HeaderPosition:=Position:C15($_t_SubHeaderStyle2; DB_t_MethodText)
If ($_l_HeaderPosition>1)
	DB_t_MethodText:=Replace string:C233(DB_t_MethodText; "••comment added and reserved by 4D.••\r"; "")
End if 
If ($_l_HeaderPosition=1)
	DB_t_MethodText:=Substring:C12(DB_t_MethodText; $_l_HeaderPosition+Length:C16($_t_SubHeaderStyle2))
End if 
$_t_SubHeaderStyle2:="•comment added and reserved by 4D.•\r"

$_l_HeaderPosition:=Position:C15($_t_SubHeaderStyle2; DB_t_MethodText)
If ($_l_HeaderPosition>1)
	DB_t_MethodText:=Replace string:C233(DB_t_MethodText; "•comment added and reserved by 4D.•\r"; "")
End if 
If ($_l_HeaderPosition=1)
	DB_t_MethodText:=Substring:C12(DB_t_MethodText; $_l_HeaderPosition+Length:C16($_t_SubHeaderStyle2))
End if 
$_t_SubHeaderStyle2:="comment added and reserved by 4D"
$_l_HeaderPosition:=Position:C15($_t_SubHeaderStyle2; DB_t_MethodText)
If ($_l_HeaderPosition>0)
	//TRACE
End if 
$_bo_CallsMethod:=False:C215
$DB_t_MethodTextOLD:=DB_t_MethodText
For ($_l_Index2; 1; Size of array:C274($_at_Paths))
	If ($_at_Paths{$_l_Index2}#"ERR_MethodTracker") & ($_at_Paths{$_l_Index2}#"ERR_MethodTrackerReturn") & ($_at_Paths{$_l_Index2}#$_at_Paths{$_l_Index})
		
		
		$_l_MethodPosition:=Position:C15($_at_Paths{$_l_Index2}; DB_t_MethodText)
		If ($_l_MethodPosition>0)
			$_bo_CallsMethod:=True:C214
			$_l_Index2:=Size of array:C274($_at_Paths)
		End if 
	End if 
	
End for 
$_l_ReturnPosition:=Position:C15("$0:="; DB_t_MethodText)
$_l_ClassPosition:=Position:C15("["; DB_t_MethodText)

SEND PACKET:C103($_ti_DocumentRef; $_at_Paths{$_l_Index}+Char:C90(9))
If ($_bo_CallsMethod)
	SEND PACKET:C103($_ti_DocumentRef; "Requres Other Function")
Else 
	If ($_l_ClassPosition=0)
		If ($_l_ReturnPosition>0)
			
			SEND PACKET:C103($_ti_DocumentRef; "Stand alone Function")
		Else 
			SEND PACKET:C103($_ti_DocumentRef; "May be Procedure-Standalone")
		End if 
	Else 
		If ($_l_ReturnPosition>0)
			
			SEND PACKET:C103($_ti_DocumentRef; "Stand alone Function-requires Class defined")
		Else 
			SEND PACKET:C103($_ti_DocumentRef; "May be Procedure-Standalone-requires Class defined")
		End if 
	End if 
	
End if 
SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))

CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("AA_JavascriptReport"; $_t_oldMethodName)
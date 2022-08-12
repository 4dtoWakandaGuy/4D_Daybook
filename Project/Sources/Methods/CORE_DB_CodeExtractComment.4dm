//%attributes = {}


If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      CORE_DB_CodeExtractComment
	//Parameter Detail:
	//------------------ Method Narrative ------------------
	
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	//
	//Related Methods: 
	
	//
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2015
	//Created BY: Nigel Greenlee
	
	//Date Modified: 
	//Modified By: 
End if 
//---------- Type Parameters & Local Variables ----------
C_LONGINT:C283($_l_Position)
C_TEXT:C284($_Txt_Header; $_Txt_MethodText; $_Txt_SubHeader; $0; $1)
//---------- Reassign Passed Parameters OR get values ----------

//-------------------- Main Method -------------------


$_Txt_MethodText:=""
If (Count parameters:C259>=1)
	$_Txt_MethodText:=$1
	$_Txt_Header:="//%attributes = {"+Char:C90(34)+"lang"+Char:C90(34)+":"+Char:C90(34)+"en"+Char:C90(34)+"}"
	$_l_Position:=Position:C15($_Txt_Header; $_Txt_MethodText)
	If ($_l_Position>0)
		$_Txt_MethodText:=Substring:C12($_Txt_MethodText; $_l_Position+Length:C16($_Txt_Header))
	Else 
		//in V14 this comment may have the folder..
		$_Txt_Header:="//%attributes = {"
		$_l_Position:=Position:C15($_Txt_Header; $_Txt_MethodText)
		If ($_l_Position>0)
			$_Txt_MethodText:=Substring:C12($_Txt_MethodText; $_l_Position+Length:C16($_Txt_Header))
			$_l_Position:=Position:C15("}"; $_Txt_MethodText)
			$_Txt_MethodText:=Substring:C12($_Txt_MethodText; $_l_Position+1)
			
		End if 
		
	End if 
	//this might seem a bit odd-the number of • before the  comment text seems to vary so we have to look for different variants.
	$_Txt_SubHeader:="comment added and reserved by 4D.\r"
	$_l_Position:=Position:C15($_Txt_SubHeader; $_Txt_MethodText)
	If ($_l_Position>0)
		$_Txt_MethodText:=Substring:C12($_Txt_MethodText; $_l_Position+Length:C16($_Txt_SubHeader))
	End if 
	$_Txt_SubHeader:="•••comment added and reserved by 4D.•••\r"
	$_l_Position:=Position:C15($_Txt_SubHeader; $_Txt_MethodText)
	If ($_l_Position>1)
		$_Txt_MethodText:=Replace string:C233($_Txt_MethodText; "•••comment added and reserved by 4D.•••\r"; "")
	End if 
	If ($_l_Position=1)
		$_Txt_MethodText:=Substring:C12($_Txt_MethodText; $_l_Position+Length:C16($_Txt_SubHeader))
	End if 
	$_l_Position:=Position:C15($_Txt_SubHeader; $_Txt_MethodText)
	If ($_l_Position>1)
		$_Txt_MethodText:=Replace string:C233($_Txt_MethodText; "••comment added and reserved by 4D.••\r"; "")
	End if 
	If ($_l_Position=1)
		$_Txt_MethodText:=Substring:C12($_Txt_MethodText; $_l_Position+Length:C16($_Txt_SubHeader))
	End if 
	$_l_Position:=Position:C15($_Txt_SubHeader; $_Txt_MethodText)
	If ($_l_Position>1)
		$_Txt_MethodText:=Replace string:C233($_Txt_MethodText; "•comment added and reserved by 4D.•\r"; "")
	End if 
	If ($_l_Position=1)
		$_Txt_MethodText:=Substring:C12($_Txt_MethodText; $_l_Position+Length:C16($_Txt_SubHeader))
	End if 
End if 
$0:=$_Txt_MethodText
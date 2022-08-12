//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_iNIConfigSetParam
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PDF_at_995tempTextArr;0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_ConfigCommand; $_t_ConfigValue; $_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_iNIConfigSetParam")

$_t_ConfigCommand:=$1
$_t_ConfigValue:=$2

$0:=False:C215
If (Is Windows:C1573)
	
	$_l_Index:=1
	
	While ($_l_Index<=Size of array:C274(PDF_at_995tempTextArr))
		If (Position:C15($_t_ConfigCommand; PDF_at_995tempTextArr{$_l_Index}; *)>0)
			PDF_at_995tempTextArr{$_l_Index}:=$_t_ConfigCommand+$_t_ConfigValue
			$0:=True:C214
			$_l_Index:=Size of array:C274(PDF_at_995tempTextArr)+1  //will exit loop
		Else 
			$_l_Index:=$_l_Index+1
		End if 
	End while 
	
	If ($0=False:C215)  //add new value
		//$_l_Index:=Size of array(PDF_at_995tempTextArr)+1
		//INSERT ELEMENT(PDF_at_995tempTextArr;$_l_Index;1)
		//PDF_at_995tempTextArr{$_l_Index}:=$_t_ConfigCommand+$_t_ConfigValue
		//Fri, May 12, 2006 bwalia: changed above to fix a bug (All params should be added before [OMNIFORMAT] else BATCH file will not be executed in side [OMNI FOMRAT])
		$_l_Index:=Size of array:C274(PDF_at_995tempTextArr)
		If ($_l_Index>1)
			$_l_Index:=2
		Else 
			$_l_Index:=1
		End if 
		INSERT IN ARRAY:C227(PDF_at_995tempTextArr; $_l_Index; 1)
		PDF_at_995tempTextArr{$_l_Index}:=$_t_ConfigCommand+$_t_ConfigValue
		
		$0:=True:C214
	End if 
End if 

ERR_MethodTrackerReturn("PDF995_iNIConfigSetParam"; $_t_oldMethodName)

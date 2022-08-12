//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_ArrayFillp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 23:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY POINTER:C280($_aptr_Parameters; 0)
	C_LONGINT:C283($_l_AreaType; $_l_ArrayLevel; $_l_Column; $_l_FieldNumber; $_l_Index; $_l_NumberOfRows; $_l_offset; $_l_Start; $_l_TableNumber; $1)
	C_POINTER:C301($_ptr_LBType; $_ptr_Table; $_Ptr_ThisRow; $_ptr_Variable; $2; $3; $4; $5; $6; $7)
	C_TEXT:C284($_t_ArraysPrefix; $_t_HighlightSet; $_t_Level; $_t_oldMethodName; $_t_VariableName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_ArrayFillp")

//This method replaces ALarrayFillP
//$1=Pointer to array of pointers
//$2=Pointer to area itseld
//$8=3)Pointer to the field in the table the data is coming from which is the KEY field(the unique ref in that table. This may point to a subtable field in the current table
//$10=4) Pointer to PARENT TABLE unique key
//ALArrayfillp
//$1» = array to fill
//$2… = values (pointers) to fill in
If (Count parameters:C259>=5)
	$_l_ArrayLevel:=$1
	ARRAY POINTER:C280($_aptr_Parameters; 19)
	If ($1<10)
		$_t_ArraysPrefix:="a0"
	Else 
		$_t_ArraysPrefix:="a"
	End if 
	$_aptr_Parameters{1}:=$3
	
	$_aptr_Parameters{2}:=Get pointer:C304($_t_ArraysPrefix+String:C10($_l_ArrayLevel)+"FldP")
	$_aptr_Parameters{3}:=Get pointer:C304($_t_ArraysPrefix+String:C10($_l_ArrayLevel)+"ArrP")
	$_aptr_Parameters{4}:=Get pointer:C304($_t_ArraysPrefix+String:C10($_l_ArrayLevel)+"ArrN")
	$_aptr_Parameters{5}:=Get pointer:C304($_t_ArraysPrefix+String:C10($_l_ArrayLevel)+"Form")
	$_aptr_Parameters{6}:=Get pointer:C304($_t_ArraysPrefix+String:C10($_l_ArrayLevel)+"Fmul")
	
	
	$_aptr_Parameters{7}:=$4
	$_aptr_Parameters{8}:=Get pointer:C304($_t_ArraysPrefix+String:C10($_l_ArrayLevel)+"Refs")
	$_aptr_Parameters{9}:=$5
	$_aptr_Parameters{10}:=Get pointer:C304($_t_ArraysPrefix+String:C10($_l_ArrayLevel)+"Titl")
	$_aptr_Parameters{11}:=Get pointer:C304($_t_ArraysPrefix+String:C10($_l_ArrayLevel)+"Widt")
	$_aptr_Parameters{12}:=Get pointer:C304($_t_ArraysPrefix+String:C10($_l_ArrayLevel)+"Ente")
	$_aptr_Parameters{13}:=Get pointer:C304($_t_ArraysPrefix+String:C10($_l_ArrayLevel)+"Lock")
	$_aptr_Parameters{14}:=Get pointer:C304($_t_ArraysPrefix+String:C10($_l_ArrayLevel)+"Font")
	
	$_aptr_Parameters{15}:=Get pointer:C304($_t_ArraysPrefix+String:C10($_l_ArrayLevel)+"Colo")
	$_aptr_Parameters{16}:=Get pointer:C304($_t_ArraysPrefix+String:C10($_l_ArrayLevel)+"Foot")
	
	If (Count parameters:C259>=6)
		
		$_ptr_LBType:=$6
		$_aptr_Parameters{17}:=$_ptr_LBType
	Else 
		$_l_AreaType:=1
		$_aptr_Parameters{17}:=->$_l_AreaType
		
	End if 
	If (Count parameters:C259>=7)
		
		$_ptr_LBType:=$7
		$_aptr_Parameters{18}:=$_ptr_LBType
	Else 
		$_t_HighlightSet:="'"
		$_aptr_Parameters{18}:=->$_t_HighlightSet
		
	End if 
	$_aptr_Parameters{19}:=Get pointer:C304($_t_ArraysPrefix+String:C10($1)+"Rollover")
	//assume array based
	
	$_l_NumberOfRows:=19  //First_Parameter is array to fill
	$_l_Start:=1  //Size of array($2->)+1
	
	//make sure the array is the right size
	ARRAY POINTER:C280($2->; $_l_NumberOfRows+2)
	//INSERT ELEMENT($2->;$_l_Start;$_l_NumberOfRows+2)  `only +1 because it was alway one less than parameters, so 2 additions makes it +1
	//Because the old method passed table and field in seperate fields
	//We will do something at $8 and $10
	//For ($_l_Index;1;$_l_NumberOfRows)
	//$_Ptr_ThisRow:=${$_l_Index+1}  `two statements for the compiler
	//$1->{$_l_Start+$_l_Index-1}:=$_Ptr_ThisRow
	//End for
	RESOLVE POINTER:C394($2; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	$_ptr_Variable:=Get pointer:C304($_t_VariableName)
	$_l_offset:=1
	
	For ($_l_Index; 1; $_l_NumberOfRows)
		$_Ptr_ThisRow:=$_aptr_Parameters{$_l_Index}  //two statements for the compiler
		$_l_Column:=$_l_Start+$_l_Index-$_l_offset
		
		Case of 
			: ($_l_Index=7)
				//TRACE
				//Get a table pointer
				$_ptr_Table:=Table:C252(Table:C252($_Ptr_ThisRow))
				If (Type:C295($2->)=13)  //it is a 2D array
					$_ptr_Variable->{$_l_TableNumber}{$_l_Column}:=$_ptr_Table
				Else 
					$2->{$_l_Column}:=$_ptr_Table
				End if 
				$_l_offset:=$_l_offset-1
				$_l_Column:=$_l_Start+$_l_Index-$_l_offset
				If (Type:C295($2->)=13)  //it is a 2D array
					$_ptr_Variable->{$_l_TableNumber}{$_l_Column}:=$_Ptr_ThisRow
				Else 
					$2->{$_l_Column}:=$_Ptr_ThisRow
				End if 
			: ($_l_Index=9)
				$_ptr_Table:=Table:C252(Table:C252($_Ptr_ThisRow))
				If (Type:C295($2->)=13)  //it is a 2D array
					$_ptr_Variable->{$_l_TableNumber}{$_l_Column}:=$_ptr_Table
				Else 
					$2->{$_l_Column}:=$_ptr_Table
				End if 
				$_l_offset:=$_l_offset-1
				$_l_Column:=$_l_Start+$_l_Index-$_l_offset
				If (Type:C295($2->)=13)  //it is a 2D array
					$_ptr_Variable->{$_l_TableNumber}{$_l_Column}:=$_Ptr_ThisRow
				Else 
					$2->{$_l_Column}:=$_Ptr_ThisRow
				End if 
				
			Else 
				
				If (Type:C295($2->)=13)  //it is a 2D array
					$_ptr_Variable->{$_l_TableNumber}{$_l_Column}:=$_Ptr_ThisRow
				Else 
					$2->{$_l_Column}:=$_Ptr_ThisRow
				End if 
				
		End case 
	End for 
End if 
ERR_MethodTrackerReturn("LBi_ArrayFillp"; $_t_oldMethodName)
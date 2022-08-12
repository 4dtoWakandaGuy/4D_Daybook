//%attributes = {}
If (False:C215)
	//Project Method Name: 
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
	C_LONGINT:C283($_l_Index; $_l_Length; $_l_ReturnProfAdditions; $_t_Prefix; $2)
	C_POINTER:C301($_Ptr_ForeNamesReturn; $_ptr_Prefixes; $_ptr_Suffixes; $_ptr_SuffixesReturn; $_ptr_SurnamesReturn; $_Ptr_TitleReturn; $_ptr_Titles; $3; $4; $5; $6)
	C_POINTER:C301($7; $8; $9)
	C_TEXT:C284($_t_Comma; $_t_CurrentWholeName; $_t_NameEmpty; $_t_NullValue; $_t_oldMethodName; $_t_PreNames; $_t_Suffix; $_t_Surname; $_t_Title; $_t_WholeName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_ParseName")

Case of 
	: (Count parameters:C259<8)
		$_ptr_Titles:=->$_t_NameEmpty
		$_ptr_Prefixes:=->$_t_NameEmpty
		$_ptr_Suffixes:=->$_t_NameEmpty
		$_ptr_SuffixesReturn:=->$_t_NameEmpty
	: (Count parameters:C259=8)
		$_ptr_Titles:=$6
		$_ptr_Prefixes:=$7
		$_ptr_Suffixes:=$8
		$_ptr_SuffixesReturn:=->$_t_NullValue
	: (Count parameters:C259=9)
		$_ptr_Titles:=$6
		$_ptr_Prefixes:=$7
		$_ptr_Suffixes:=$8
		$_ptr_SuffixesReturn:=$9
End case 
$_t_WholeName:=$1
$_l_ReturnProfAdditions:=$2
$_Ptr_TitleReturn:=$3
$_Ptr_ForeNamesReturn:=$4
$_ptr_SurnamesReturn:=$5
$_t_Title:=""
$_t_PreNames:=""
$_t_Surname:=""
$_t_Suffix:=""
$_t_Prefix:=0
If (Count parameters:C259>=5)
	
	//Check the whole of the name is not a title•
	If ($_t_WholeName#"")
		Repeat 
			If ($_t_WholeName[[Length:C16($_t_WholeName)]]=" ")
				$_t_WholeName:=Substring:C12($_t_WholeName; 1; Length:C16($_t_WholeName)-1)
			End if 
		Until ($_t_WholeName[[Length:C16($_t_WholeName)]]#" ")
	End if 
	
	
	If (Find in array:C230($_ptr_Titles->; $_t_WholeName)#-1)  //If  all we have is a title stop looking
		$_t_Title:=$1
		$_t_WholeName:=""
	End if 
	$_l_Length:=Length:C16($_t_WholeName)
	//Disconect the surname•
	If ($_l_Length>0)
		For ($_l_Index; $_l_Length; 1; -1)  //Start at the end
			//Build till we find a space
			If ($_t_WholeName#"")
				If ($_t_WholeName[[$_l_Index]]#(Char:C90(32)))
					If ($_t_Surname="")
						$_t_Surname:=$_t_WholeName[[$_l_Index]]
					Else 
						$_t_Surname:=$_t_WholeName[[$_l_Index]]+$_t_Surname
					End if 
				Else   //When we find a space
					//If there was a comma take it away for now
					If ($_t_Surname#"")
						If ($_t_Surname[[1]]=",")
							//Take a leading comma away•
							$_t_Comma:=","
							$_t_Surname:=Substring:C12($_t_Surname; 2; Length:C16($_t_Surname))
						Else 
							$_t_Comma:=""
						End if 
						If ($_t_Surname[[Length:C16($_t_Surname)]]=",")
							//Take a trailing comma away
							$_t_Surname:=Substring:C12($_t_Surname; 1; Length:C16($_t_Surname)-1)
						End if 
						If (Find in array:C230($_ptr_Suffixes->; $_t_Surname)=-1)  //if this is not a known surname suffix such as cbe
							$_t_WholeName:=Substring:C12($_t_WholeName; 1; $_l_Index-1)
							$_t_Surname:=$_t_Comma+$_t_Surname
							If ($_t_Surname=$_t_WholeName)
								
							End if 
							
							//$_t_Surname will now be the surname
							$_l_Index:=1
						Else   //There may be more than one suffix
							$_t_Surname:=$_t_Comma+$_t_Surname
							If ($_t_Suffix="")
								$_t_Suffix:=$_t_Comma+" "+$_t_Surname
								$_t_Surname:=""
							Else 
								$_t_Suffix:=$_t_Suffix+$_t_Comma+" "+$_t_Surname
								$_t_Surname:=""
							End if 
						End if 
					End if 
				End if 
			End if 
		End for 
		If ($_t_Surname=$_t_WholeName)  //there is one word!!!!!
			$_t_Surname:=""
		End if 
		//if The application only stores surname
		If ($_l_ReturnProfAdditions=0)
			$_t_Surname:=$_t_Surname+$_t_Suffix
		Else 
			If (Count parameters:C259>=9)
				$_ptr_SuffixesReturn->:=$_t_Suffix
			Else 
				$_t_Surname:=$_t_Surname+$_t_Suffix
			End if 
			
		End if 
		
		
		//The above section will return the surname plus and suffix(es) like MBE
		
		//And reduce $_t_WholeName to the remainder
		//So we start working from the end again
		//Looking for a title•
		If ($_t_WholeName#"")
			//*******************
			//Check the rest of the name is not a title•
			If (Find in array:C230($_ptr_Titles->; $_t_WholeName)#-1)  //If  title exists stop looping
				$_t_Title:=$_t_WholeName
				$_t_WholeName:=""
			End if 
			//**********************
			If ($_t_WholeName#"")
				For ($_l_Index; Length:C16($_t_WholeName); 1; -1)
					If ($_t_WholeName[[$_l_Index]]#" ")
						If ($_t_PreNames="")
							$_t_PreNames:=$_t_WholeName[[$_l_Index]]
						Else 
							$_t_PreNames:=$_t_WholeName[[$_l_Index]]+$_t_PreNames
						End if 
					Else 
						If ($_t_PreNames#"")
							$_t_Title:=Substring:C12($_t_WholeName; 1; ($_l_Index-1))
							
							If (Find in array:C230($_ptr_Prefixes->; $_t_PreNames)#-1)  //(von,van etc)
								//if this is a prefix
								$_t_Surname:=$_t_PreNames+" "+$_t_Surname
								$_t_WholeName:=Substring:C12($_t_WholeName; 1; ((Length:C16($_t_WholeName))-((Length:C16($_t_PreNames)+1))))
								$_t_PreNames:=""
							End if 
							
							If (Find in array:C230($_ptr_Titles->; $_t_Title)#-1)  //If  title exists stop looping
								$_l_Index:=1
							Else   //keep looping
								$_t_Title:=""
								If (Length:C16($_t_WholeName)>=$_l_Index)
									$_t_PreNames:=$_t_WholeName[[$_l_Index]]+$_t_PreNames
								End if 
							End if 
						End if 
					End if 
					
				End for 
			End if 
		End if 
	End if 
	
	//$_t_Surname is surname
	//$_t_PreNames is prenames
	//        $_t_Title is title
	$_Ptr_TitleReturn->:=$_t_Title
	$_Ptr_ForeNamesReturn->:=$_t_PreNames
	$_ptr_SurnamesReturn->:=$_t_Surname
End if 
ERR_MethodTrackerReturn("AA_ParseName"; $_t_oldMethodName)

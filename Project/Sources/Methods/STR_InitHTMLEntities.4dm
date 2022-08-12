//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_InitHTMLEntities
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
	//ARRAY TEXT(<>HTML_at_Entities;0)
	C_BOOLEAN:C305(<>HTML_bo_EntitiesInitialized)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_InitHTMLEntities")

// (PM) STR_InitHTMLEntities
// Initializes an array with the HTML entities for Latin1


If (<>HTML_bo_EntitiesInitialized=False:C215)
	
	<>HTML_bo_EntitiesInitialized:=True:C214
	
	// Fill an array with the characters that need substitution
	// The index matches the codepoint within ISO Latin 1 encoding
	ARRAY TEXT:C222(<>HTML_at_Entities; 255)
	
	<>HTML_at_Entities{34}:="&quot;"
	<>HTML_at_Entities{38}:="&amp;"
	<>HTML_at_Entities{39}:="&apos;"
	<>HTML_at_Entities{60}:="&lt;"
	<>HTML_at_Entities{62}:="&gt;"
	<>HTML_at_Entities{160}:="&nbsp;"
	<>HTML_at_Entities{161}:="&iexcl;"
	<>HTML_at_Entities{162}:="&cent;"
	<>HTML_at_Entities{163}:="&pound;"
	<>HTML_at_Entities{164}:="&curren;"
	<>HTML_at_Entities{165}:="&yen;"
	<>HTML_at_Entities{166}:="&brvbar;"
	<>HTML_at_Entities{167}:="&sect;"
	<>HTML_at_Entities{168}:="&uml;"
	<>HTML_at_Entities{169}:="&copy;"
	<>HTML_at_Entities{170}:="&ordf;"
	<>HTML_at_Entities{171}:="&laquo;"
	<>HTML_at_Entities{172}:="&not;"
	<>HTML_at_Entities{173}:="&shy;"
	<>HTML_at_Entities{174}:="&reg;"
	<>HTML_at_Entities{175}:="&macr;"
	<>HTML_at_Entities{176}:="&deg;"
	<>HTML_at_Entities{177}:="&plusmn;"
	<>HTML_at_Entities{178}:="&sup2;"
	<>HTML_at_Entities{179}:="&sup3;"
	<>HTML_at_Entities{180}:="&acute;"
	<>HTML_at_Entities{181}:="&micro;"
	<>HTML_at_Entities{182}:="&para;"
	<>HTML_at_Entities{183}:="&middot;"
	<>HTML_at_Entities{184}:="&cedil;"
	<>HTML_at_Entities{185}:="&sup1;"
	<>HTML_at_Entities{186}:="&ordm;"
	<>HTML_at_Entities{187}:="&raquo;"
	<>HTML_at_Entities{188}:="&frac14;"
	<>HTML_at_Entities{189}:="&frac12;"
	<>HTML_at_Entities{190}:="&frac34;"
	<>HTML_at_Entities{191}:="&iquest;"
	<>HTML_at_Entities{192}:="&Agrave;"
	<>HTML_at_Entities{193}:="&Aacute;"
	<>HTML_at_Entities{194}:="&Acirc;"
	<>HTML_at_Entities{195}:="&Atilde;"
	<>HTML_at_Entities{196}:="&Auml;"
	<>HTML_at_Entities{197}:="&Aring;"
	<>HTML_at_Entities{198}:="&AElig;"
	<>HTML_at_Entities{199}:="&Ccedil;"
	<>HTML_at_Entities{200}:="&Egrave;"
	<>HTML_at_Entities{201}:="&Eacute;"
	<>HTML_at_Entities{202}:="&Ecirc;"
	<>HTML_at_Entities{203}:="&Euml;"
	<>HTML_at_Entities{204}:="&Igrave;"
	<>HTML_at_Entities{205}:="&Iacute;"
	<>HTML_at_Entities{206}:="&Icirc;"
	<>HTML_at_Entities{207}:="&Iuml;"
	<>HTML_at_Entities{208}:="&ETH;"
	<>HTML_at_Entities{209}:="&Ntilde;"
	<>HTML_at_Entities{210}:="&Ograve;"
	<>HTML_at_Entities{211}:="&Oacute;"
	<>HTML_at_Entities{212}:="&Ocirc;"
	<>HTML_at_Entities{213}:="&Otilde;"
	<>HTML_at_Entities{214}:="&Ouml;"
	<>HTML_at_Entities{215}:="&times;"
	<>HTML_at_Entities{216}:="&Oslash;"
	<>HTML_at_Entities{217}:="&Ugrave;"
	<>HTML_at_Entities{218}:="&Uacute;"
	<>HTML_at_Entities{219}:="&Ucirc;"
	<>HTML_at_Entities{220}:="&Uuml;"
	<>HTML_at_Entities{221}:="&Yacute;"
	<>HTML_at_Entities{222}:="&THORN;"
	<>HTML_at_Entities{223}:="&szlig;"
	<>HTML_at_Entities{224}:="&agrave;"
	<>HTML_at_Entities{225}:="&aacute;"
	<>HTML_at_Entities{226}:="&acirc;"
	<>HTML_at_Entities{227}:="&atilde;"
	<>HTML_at_Entities{228}:="&auml;"
	<>HTML_at_Entities{229}:="&aring;"
	<>HTML_at_Entities{230}:="&aelig;"
	<>HTML_at_Entities{231}:="&ccedil;"
	<>HTML_at_Entities{232}:="&egrave;"
	<>HTML_at_Entities{233}:="&eacute;"
	<>HTML_at_Entities{234}:="&ecirc;"
	<>HTML_at_Entities{235}:="&euml;"
	<>HTML_at_Entities{236}:="&igrave;"
	<>HTML_at_Entities{237}:="&iacute;"
	<>HTML_at_Entities{238}:="&icirc;"
	<>HTML_at_Entities{239}:="&iuml;"
	<>HTML_at_Entities{240}:="&eth;"
	<>HTML_at_Entities{241}:="&ntilde;"
	<>HTML_at_Entities{242}:="&ograve;"
	<>HTML_at_Entities{243}:="&oacute;"
	<>HTML_at_Entities{244}:="&ocirc;"
	<>HTML_at_Entities{245}:="&otilde;"
	<>HTML_at_Entities{246}:="&ouml;"
	<>HTML_at_Entities{247}:="&divide;"
	<>HTML_at_Entities{248}:="&oslash;"
	<>HTML_at_Entities{249}:="&ugrave;"
	<>HTML_at_Entities{250}:="&uacute;"
	<>HTML_at_Entities{251}:="&ucirc;"
	<>HTML_at_Entities{252}:="&uuml;"
	<>HTML_at_Entities{253}:="&yacute;"
	<>HTML_at_Entities{254}:="&thorn;"
	<>HTML_at_Entities{255}:="&yuml;"
	
	// In non Unicode mode we substitute the currency symbol with the Euro symbol
	// even though ISO Latin 1 does not contain the Euro character
	//v11  `If (Get database parameter(Unicode mode)=0)
	<>HTML_at_Entities{164}:="&eur;"
	//v11  `End if
	
End if 
ERR_MethodTrackerReturn("STR_InitHTMLEntities"; $_t_oldMethodName)
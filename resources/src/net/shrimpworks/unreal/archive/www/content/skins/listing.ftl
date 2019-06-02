<#assign game=page.letter.game>

<#assign ogDescription="Custom player skins for ${game.game.bigName}">
<#assign ogImage="${staticPath()}/images/games/${game.name}.png">

<#include "../../_header.ftl">
<#include "../../macros.ftl">

	<@heading bg=["${staticPath()}/images/games/${game.name}.png"]>
			<a href="${relPath(sectionPath + "/index.html")}">Skins</a>
			/ <a href="${relPath(game.path + "/index.html")}">${game.name}</a>
			<#if game.letters?size gt 1>/ ${page.letter.letter}</#if>
		  <#if page.letter.pages?size gt 1>/ pg ${page.number}</#if>
	</@heading>

	<@content class="list">

		<@letterPages letters=game.letters currentLetter=page.letter.letter pages=page.letter.pages currentPage=page />

		<table class="skins">
			<thead>
			<tr>
				<th>Skin</th>
				<th>Author</th>
				<th>Info</th>
				<th class="nomobile"> </th>
			</tr>
			</thead>
			<tbody>
				<#list page.skins as s>
				<tr class="${s?item_parity}">
					<td nowrap="nowrap"><a href="${relPath(s.path + ".html")}">${s.skin.name}</a></td>
					<td>${s.skin.author}</td>
					<td>
						<#if s.skin.skins?size gt 0>
							${s.skin.skins?size} skin<#if s.skin.skins?size gt 1>s</#if>
							<#if s.skin.faces?size gt 0>,</#if>
						</#if>
						<#if s.skin.faces?size gt 0>
							${s.skin.faces?size} face<#if s.skin.faces?size gt 1>s</#if>
						</#if>
					</td>
					<td class="meta nomobile">
						<#if s.skin.attachments?size gt 0>
							<img src="${staticPath()}/images/icons/black/px22/ico-images-grey.png" alt="Has images"/>
						</#if>
					</td>
				</tr>
				</#list>
			</tbody>
		</table>
	</@content>

<#include "../../_footer.ftl">
<#include "../../_header.ftl">
<#include "../macros.ftl">

	<@heading bg=["${static}/images/games/${game.name}.png"]>
		<h1>
			<a href="${siteRoot}/index.html">Skins</a>
			/ <a href="${relUrl(siteRoot, game.path)}/index.html">${game.name}</a>
		</h1>
	</@heading>

	<@content class="list">
		<table class="skins">
			<thead>
			<tr>
				<th>Skin</th>
				<th>Author</th>
			</tr>
			</thead>
			<tbody>
				<#list skins as s>
				<tr>
					<td><a href="${relUrl(game.path, s.path + ".html")}">${s.skin.name}</a></td>
					<td>${s.skin.author}</td>
				</tr>
				</#list>
			</tbody>
		</table>
	</@content>

<#include "../../_footer.ftl">
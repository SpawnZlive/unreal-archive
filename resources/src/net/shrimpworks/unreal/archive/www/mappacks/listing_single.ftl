<#include "../_header.ftl">

	<#assign game=gametype.game>

	<section class="header" style='background-image: url("${static}/images/gametypes/${game.name}/${gametype.name}.png"), url("${static}/images/games/${game.name}.png")'>
		<h1>
			<a href="${siteRoot}/index.html">Map Packs</a>
			/ <a href="${relUrl(siteRoot, game.path)}/index.html">${game.name}</a>
			/ <a href="${relUrl(siteRoot, gametype.path)}/index.html">${gametype.name}</a>
		</h1>
	</section>
	<article class="list">
		<table class="mappacks">
			<thead>
			<tr>
				<th>Name</th>
				<th>Author</th>
				<th>Maps</th>
			</tr>
			</thead>
			<tbody>
				<#list packs as p>
				<tr>
					<td><a href="${relUrl(gametype.path, p.path + ".html")}">${p.pack.name}</a></td>
					<td>${p.pack.author}</td>
					<td>${p.pack.maps?size}</td>
				</tr>
				</#list>
			</tbody>
		</table>
	</article>

<#include "../_footer.ftl">
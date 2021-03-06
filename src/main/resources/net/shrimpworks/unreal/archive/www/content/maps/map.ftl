<#assign game=map.page.letter.gametype.game>
<#assign gametype=map.page.letter.gametype>

<#assign headerbg>${staticPath()}/images/games/${game.name}.png</#assign>

<#list map.map.attachments as a>
	<#if a.type == "IMAGE">
		<#assign headerbg=urlEncode(a.url)>
		<#break>
	</#if>
</#list>

<#assign ogDescription="${map.map.autoDescription()}">
<#assign ogImage=headerbg>

<#include "../../_header.ftl">
<#include "../../macros.ftl">

	<@heading bg=[headerbg]>
		<a href="${relPath(sectionPath + "/index.html")}">Maps</a>
		/ <a href="${relPath(game.path + "/index.html")}">${game.name}</a>
		/ <a href="${relPath(gametype.path + "/index.html")}">${gametype.name}</a>
		/ ${map.map.name}
	</@heading>

	<@content class="info">
		<div class="screenshots">
			<@screenshots attachments=map.map.attachments/>
		</div>

		<div class="info">

			<#assign themes>
				<#if map.map.themes?size gt 0>
					<#list map.map.themes as theme, weight>
						<div class="theme-gauge">
							<div class="part p${theme?index}" style="width: ${weight * 100}%">${theme}</div>
						</div>
					</#list>
				<#else>
					Unknown
				</#if>
			</#assign>

			<#assign
			labels=[
				  "Name",
					"Game Type",
					"Title",
					"Author",
					"Player Count",
					"AI/Bot Support",
					"Release (est)",
					"Description",
					"Themes",
					"File Size",
					"File Name",
					"Hash"
			]

			values=[
					'${map.map.name}',
					'<a href="${relPath(gametype.path + "/index.html")}">${map.map.gametype}</a>'?no_esc,
					'${map.map.title}',
					'${map.map.author}',
					'${map.map.playerCount}',
					'${map.map.bots?string("Yes", "No")}',
					'${dateFmtShort(map.map.releaseDate)}',
					'${map.map.description?replace("||", "<br/><br/>")?no_esc}',
      		'${themes}',
      		'${fileSize(map.map.fileSize)}',
					'${map.map.originalFilename}',
					'${map.map.hash}'
			]

			styles={"10": "nomobile"}
			>

			<@meta title="Map Information" labels=labels values=values styles=styles/>

			<#if map.variations?size gt 0>
				<section class="variations">
					<h2><img src="${staticPath()}/images/icons/variant.svg" alt="Variations"/>Variations</h2>
					<table>
						<thead>
						<tr>
							<th>Name</th>
							<th>Release Date (est)</th>
							<th>File Name</th>
							<th>File Size</th>
						</tr>
						</thead>
						<tbody>
							<#list map.variations as v>
							<tr>
								<td><a href="${relPath(v.path + ".html")}">${v.map.name}</a></td>
								<td>${v.map.releaseDate}</td>
								<td>${v.map.originalFilename}</td>
								<td>${fileSize(v.map.fileSize)}</td>
							</tr>
							</#list>
						</tbody>
					</table>
				</section>
			</#if>

			<@files files=map.map.files alsoIn=map.alsoIn otherFiles=map.map.otherFiles/>

			<@downloads downloads=map.map.downloads/>

			<@ghIssue text="Report a problem" repoUrl="${dataProjectUrl}" title="[Map] ${map.map.name}" hash="${map.map.hash}" name="${map.map.name}"/>

		</div>

	</@content>

<#include "../../_footer.ftl">
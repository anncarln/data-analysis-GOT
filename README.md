<h1>Projeto de encerramento do módulo 2 do Acelera Tech Talents - Resilia + Neon - Visualização de dados</h1>

<img src="https://github.com/anncarln/data-analysis-GOT/blob/main/img/developers.png?raw=true" alt="Desenvolvedores">

<h2>Sobre</h2>
<p>A proposta do projeto é a de criar uma dashboard com base em um conjunto de dados da série norte-americana Game of Thrones, criada por David Benioff e D. B. Weiss, baseada na série de livros A Song of Ice and Fire de George R. R. Martin.
</p>

<h2>Materiais disponibilizados</h2>
<p>Para compor os esquemas do banco de dados, foram forcenidas 3 tabelas com informações referentes aos <a href="https://github.com/anncarln/data-analysis-GOT/blob/main/data/game-of-thrones-tables/characters.csv">personagens</a>, <a href="https://github.com/anncarln/data-analysis-GOT/blob/main/data/game-of-thrones-tables/episodes.csv">episódios</a> e <a href="https://github.com/anncarln/data-analysis-GOT/blob/main/data/game-of-thrones-tables/houses.csv">casas</a> da série.</p>

<h2>Perguntas levantadas</h2>
<p>Ao analisar os dados fornecidos, as principais perguntas levantadas foram:</p>
<ul>
  <li>Quais são os personagens que ficaram vivos por mais tempo na série e em quantos episódios apareceram?</li>
  <li>Quais são os personagens mais importantes de todas as temporadas?</li>
  <li>Qual é a média de avaliação dos episódios por temporada?</li>
  <li>Quais são os episódios mais longos da série?</li>
  <li>Qual é a quantidade de casas existentes em cada uma das regiões que compõe os reinos de Game of Thrones?</li>
  <li>Quem são os diretores com maior número de episódios dirigidos por eles?</li>
</ul>

<h2>Resultados</h2>
<img src="https://github.com/anncarln/data-analysis-GOT/blob/main/graphics/characteres-alive.png?raw=true" alt="Personagens vivos por mais tempo">
<p>Para gerar esse gráfico foi feita uma busca dos personagens na tabela de personagens e uma subtração dos valores da coluna que tem a última aparição do personagem na série e a coluna com a primeira aparição do personagem.</p>
<img src="https://github.com/anncarln/data-analysis-GOT/blob/main/graphics/characteres-beloved.png?raw=true" alt="Personagens mais importantes">
<p>Para gerar esse gráfico, foi feita uma busca da coluna personagem da tabela personagens onde o valor da coluna atores estivesse dentro da coluna de personagens principais da tabela episódios.</p>
<img src="https://github.com/anncarln/data-analysis-GOT/blob/main/graphics/houses.png?raw=true" alt="Casas por região">
<p>Para gerar esse gráfico, foi feita uma busca na coluna região da tabela casas, em seguida foi somado a quantidade de vezes em que cada uma das regiões aparecia na tabela. Com o total, a tabela de consulta gerada foi posta em ordem descrente e limitada para aparecer apenas 10 linhas.</p>
<img src="https://github.com/anncarln/data-analysis-GOT/blob/main/graphics/season-rating.png?raw=true" alt="Média de avaliação">
<p>Parar gerar esse gráfico, foi feita uma busca na tabela episódios que retornou na consulta a coluna de temporadas juntamente com a média das avaliações da coluna de avaliações. Os valores da média foram postos então em ordem descrecente.</p>
<img src="https://github.com/anncarln/data-analysis-GOT/blob/main/graphics/directors.png?raw=true" alt="Diretores">
 <p>Para gerar esse gráfico, foi feita uma busca na coluna do nome dos diretores na tabela episódio, em que foi calculada a quantidade de ocorrência para o mesmo diretor. A tabela de consulta com esses valores foi posta então em ordem descrecente e limitada para mostrar apenas 3 linhas que compõe o top 3.</p>
  <img src="https://github.com/anncarln/data-analysis-GOT/blob/main/graphics/duration-episodes.png?raw=true" alt="Duração dos episódios">
  <p>Para gerar esse gráfico, foi feita uma busca na coluna que mostra o tempo de duração de cada um dos episódios. Foi gerada então uma tabela de consulta ordenada do maior tempo de duração para o menor e limitada para mostrar apenas 3 linhas que compõe o top 3.</p>

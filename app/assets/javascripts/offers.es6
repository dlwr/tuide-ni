function  fetchMentions () {
  let container = document.getElementById('mentions')
  fetch(`${location.href}/mentions`)
    .then(response => response.json())
    .then(function(json) {
      for(let mention of json) {
        if (document.getElementById(`mention_${mention.id}`))
          continue
        let mentionEl = document.createElement('div')
        mentionEl.id = `mention_${mention.id}`
        if (mention.user && mention.user.picture_url) {
          let profileImg = document.createElement('img')
          profileImg.src = mention.user.picture_url
          profileImg.className = "img-thumbnail"
          profileImg.style.width = "70px"
          mentionEl.appendChild(profileImg)
        }
        let textNode = document.createTextNode(`${mention.user.display_name} 「${mention.text}」`)
        mentionEl.appendChild(textNode)
        container.appendChild(mentionEl)
      }
    })
}

function mentionPoll () {
  window.setInterval(this.fetchMentions, 15 * 1000)
}

if(location.pathname.match(/^\/offers\/\d/)) {
  document.addEventListener('DOMContentLoaded', () => {
    fetchMentions()
    mentionPoll()
  })
}
